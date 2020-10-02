#!/bin/env python3

import os,sys,subprocess,argparse
import numpy as np




# Arguments
_args = ['N','src','param0','param1','props','output','scale']
_types = [int,str,list,list,list,str,int]
_defaults = [5,'http://www-personal.umich.edu/~bkochuna/NERS570/Lab2/thermo_water',
		[400,600,800],[0,100],['temperature[K]','pressure[MPa]','density[g/ml]','viscosity[Pa*s]','enthalpy[kJ/kg]'],
		'water_prop_%d.csv',10]

parser = argparse.ArgumentParser(description = "Parse Arguments")

for arg,default,typ in zip(_args,_defaults,_types):
	parser.add_argument('-%s'%(arg),default=default,type=typ)

args, unknown = parser.parse_known_args()
args = vars(args)
args.update({inputs[i]:sys.argv[i+1] for i in range(min(len(sys.argv)-1,len(_args)))})

for arg in args:
	print(arg,args[arg])


# Processes

process = lambda command: subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True).communicate()[0]


cmd = 'pwd'
args['cwd'] = process(cmd)


# Executable
root = "Ex2"
cmd = 'mkdir -p %s && cd %s'%(root,root)
process(cmd);

exe = args['src'].split(os.path.sep)[-1]

cmd = 'rm -fr %si && wget -q %s && chmod +x %s'%(exe,args['src'],exe)
process(cmd);


# Output File
file = args['output']%(args['N'])
delimeter = ','
names = [prop.split('[')[0]  for prop in args['props']]
units = [prop.split('[')[1].split(']')[0]  for prop in args['props']]
header = ["\"%s [%s]\""%(name,unit) for name,unit in zip(names[1:],units[1:])]
properties = names[2:]


# Parameter Sweep

args['param1'] = np.linspace(args['param1'][0],args['param1'][1],args['N']+1,endpoint=True)
n,p = len(args['param1']),len(header)
data = np.zeros((n,p))


for p0 in args['param0']:
	dir = '%d%s'%(p0,units[0])
	cmd = 'mkdir -p %s'%(os.path.join(root,dir))
	process(cmd);

	# Write to File
	with open(os.path.join(root,dir,file),'w') as f:
		f.write(delimeter.join(header))
		f.write('\n')	
		for i,p1 in enumerate(args['param1']):
			data[i] = [p1,*[process('./%s %f %f %s'%(exe,p0,p1,prop)) for prop in properties]]

			f.write(delimeter.join(['%0.*e'%(args['scale'],d) for d in data[i]]))
			if i < (n-1):
				f.write('\n')	
	




