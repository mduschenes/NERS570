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
	value = [str(v) if not callable(v) else v for v in value]
	set_value(key,value,array)
	return


def set_argument(key,value,array):
	if value in [delimeters["IFS"]]:
		return
	for k in key.split(delimeters["IFS"]):
		if isinstance(value,str):
			val="%s%s%s"%(k,delimeters['set'],value)
		else:
			val= lambda *args,key=k,_value=value,**kwargs: _value(key,*args,**kwargs) 
		array.append(val)
	return

def get_argument(key,array):
	return array[key]

def get_iterations(flag,args):
	keys=['%s%s%s'%(delimeters['flag'],s,delimeters['set']) for s in ['n','m']]
	values=[]
	for a in args:
		for k in keys:
			if k in a:
				values.append(a.replace(k,''))
	if values == []:
		return ''


	values=list(set(values))
	value = str(min(values))
	arg ='%s%s%s'%(flag,delimeters['set'],value)
	return arg


# Simulation Type
_args = ['simulation','presource','source','exe']
_defaults = ['release','time mpiexec -n 2 ','./','ex15']
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




_simulations_keys = ['debug','release','condition']
_simulations_defaults = {'ksp_type':['cg'],'n m':[8],
	                     'ksp_gmres_restart':[get_iterations],'pc_type':['none'],
		}
_subsimulations_defaults = {'ksp_type':{'gmres':['ksp_gmres_restart']},
			    # 'pc_type': {'ilu':['mat_type'],'icc':['mat_type']}
			   }

_keys = {k: ["ksp_type","n m",'pc_type'] for k in _simulations_keys}
_keys['condition'].extend(['ksp_monitor_singular_value'])

_simulations = {k: copy.deepcopy(_simulations_defaults) for k in _simulations_keys}
_simulations['release'].update({
			       'ksp_type':['cg','bcgs','gmres'],
			       'n m':[8,32,128,256,512,1024],
			       'ksp_gmres_restart':[get_iterations,30,200],
	        	       'ksp_monitor_singular_value':[''],
				})

_simulations['condition'].update({
			       'ksp_type':['cg','gmres'],
			       'n m':[8,32,128,256,512,1024],
			       'pc_type':['none','jacobi','sor','ilu','icc','gamg'],
			       'ksp_gmres_restart':[get_iterations],
	        	       'ksp_monitor_singular_value':[''],
			       'mat_type':[],
				})
_subsimulations={k:copy.deepcopy(_subsimulations_defaults) for k in _simulations_keys}

keys = _keys[args['simulation']]
simulations = _simulations[args['simulation']]
subsimulations = _subsimulations[args['simulation']]

#print(keys)
for key in keys:

	flag=key
	values=simulations[flag]
	set_flag(key,flag,flags)
	set_parameter(key,values,parameters)
	for value in subsimulations.get(key,[]):
		for flag in subsimulations[key][value]:
			values=simulations[flag]
			set_flag([key,value],flag,subflags)
			set_parameter([key,value],values,subparameters)

#print(subflags)
#print(subparameters)
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

#print(arguments)
for argument in arguments[:]:
	_arguments = [[s(argument) if callable(s) else s for s in subarguments[key][value]]
			for key in subarguments 
			for value in subarguments[key] 
			if ((argument[keys.index(key)+sum([k.count(delimeters['IFS']) for k in keys[:keys.index(key)]])]==value) and (subarguments.get(key,{}).get(value) not in [[],None]))]
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
commands = [*[(lambda *arguments,s=s:' '.join(['%s%s%s%s'%(s,args['presource'] if not any([s in arguments for s in ['-pc_type ilu','-pc_type icc']]) else 'time ',args['source'],args['exe']),*arguments])) for s in ['echo ','']],
            *[(lambda *arguments,s=s: '%s'%(s)) for s in ['sleep 2','echo ','']]
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
