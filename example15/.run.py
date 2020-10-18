#!/usr/bin/env python

# Import modules
import os,sys,stat,itertools,copy

# Delimeters
delimeters={}
delimeters["flag"]="-"
delimeters["set"]=" "
delimeters["IFS"]=" "
delimeters["file"]=","


def set_value(key,value,array):
	a = array
	if isinstance(key,list):
		for k in key[:-1]:
			if not isinstance(a.get(k),dict):
				a[k] = {}
			a = a[k]
	else:
		key = [key]
	a[key[-1]] = value
	return


def set_flag(key,value,array):
	value=delimeters["IFS"].join(["%s%s"%(delimeters["flag"],v) for v in value.split(delimeters["IFS"])])
	set_value(key,value,array)
	return

def set_parameter(key,value,array):
	if not isinstance(value,(tuple,list)):
		value=[value]
	value = [str(v) for v in value]
	set_value(key,value,array)
	return


def set_argument(key,value,array):
	if value in [delimeters["IFS"]]:
		return
	for k in key.split(delimeters["IFS"]):
		val="%s%s%s"%(k,delimeters["set"],value)
		array.append(val)
	return

def get_argument(key,array):
	return

# Simulation Type
simulation='debug'
exe="ex15"
_args = ['simulation','source','exe']
_defaults = ['release','time mpiexec -n 2 ./','ex15']
args = dict(zip(_args,_defaults))
args.update(dict(zip(_args,sys.argv[1:])))

# Program
files={}
_file = '.'.join(__file__.split('.')[:-1])
files['run'] = '%s.%s'%(_file,'sh')
files['output'] = '%s.%s'%(_file,'log')


# Parameters
flags={}
subflags={}
parameters={}
subparameters={}

keys = ["ksp_type","n m"]


simulations = {
	              'debug':   {'ksp_type':['cg'],'n m':[8],'ksp_gmres_restart':[""]},
		      'release': {'ksp_type':['cg','bcgs','gmres'],'n m':[8,32,128,256,512,1024],'ksp_gmres_restart':["",30,200]}
		      }


i=0
key=keys[i]
flag=key
values=simulations[args['simulation']][flag]
set_flag(key,flag,flags)
set_parameter(key,values,parameters)

value="gmres"
flag="ksp_gmres_restart"
values=simulations[args['simulation']][flag]
set_flag([key,value],flag,subflags)
set_parameter([key,value],values,subparameters)


i=1
key=keys[i]
flag=key
values=simulations[args['simulation']][flag]
set_flag(key,flag,flags)
set_parameter(key,values,parameters)


#print(keys)
#print(flags)
#print(parameters)
#print(subflags)
#print(subparameters)
#print()


# Arguments
arguments = []
values = [list(values) for values in itertools.product(*[parameters[key] for key in keys],repeat=1)]
for value in values:
	arguments.append([])
	for key,val in zip(keys,value):
		set_argument(flags[key],val,arguments[-1])

subarguments={}
for key in subparameters:
	subarguments[key]={}
	for value in subparameters[key]:
		_value = []
		set_argument(flags[key],value,_value)
		_value = _value[0]
		subarguments[key][_value] = []
		for s in subparameters[key][value]:
			set_argument(subflags[key][value],s,subarguments[key][_value])


for argument in arguments[:]:
	_arguments = [subarguments[key][value]
			for key in subarguments 
			for value in subarguments[key] 
			if argument[keys.index(key)]==value]
	if _arguments == []:
		continue
	i = arguments.index(argument)
	_argument = arguments.pop(i)
	i -= 1
	for _arg in itertools.product(*_arguments,repeat=1):
		i += 1
		arguments.insert(i,_argument+list(_arg))
				


# Run Commands
writer = lambda f,s: f.write("%s\n"%(s))
shebang='#!/bin/bash'
logging=["{","} 2>&1 | tee %s"%(files['output'])]
commands = [*[(lambda *arguments,s=s:' '.join(['%s%s%s'%(s,args['source'],args['exe']),*arguments])) for s in ['echo ','']],
            *[(lambda *arguments,s=s: '%s'%(s)) for s in ['sleep 1','echo ','']]
           ]
with open(files['run'],'w') as f:
	writer(f,shebang)
	writer(f,logging[0])
	for argument in arguments:
		for command in commands:
			writer(f,command(*argument))
	writer(f,logging[1])
			
	

st = os.stat(files['run'])
os.chmod(files['run'], st.st_mode | stat.S_IXUSR)
