
# Import python modules
import os,sys,copy,itertools,re

from natsort import natsorted

_DELIMETER = '__'

class Texify(object):
	def __init__(self,texstrings={},texargs={},usetex=True):
		Nops = int((5**3-1)/(5-1))
		args_default = {
		'iter':{'monomial':1,'polynomial':0,'taylorseries':1,},
		'Nops':Nops,'order':2,'groups':2,'basis':3,'Nterms':32,
		'iterations':Nops,'dims':5,
		'root':'ROOT',
		'iloc':[0],
		'methods':['grad','monomial'],
		'normalizations':['None','l2'],
		'stepwise_methods':['cheapest'] ,  
		'transform_base':['None','monomial'],
		'transform_order':['None'],
		'transform_method':['None'],
		'transform_scheme':['None'],        
		'metrics':['diff','gauss'],
		'model':['model','model_loss'],
		'inputs': {'%s%d'%(x,i):r'{%s_{%d}}'%(x,i) for x in ['x'] for i in range(5)},
		'outputs': {'%s%d'%(x,i):r'{%s_{%d}}'%(x,i) for x in ['y'] for i in range(3)},
		'constants':{},
		}

		args_special = {'inputs':{},'outputs':{},'constants':{},'order':1,'basis':1}

		args = {}
		args.update(texargs)
		args.update({k:v for k,v in args_default.items() if k not in args})
		args.update({k:v for k,v in args_special.items() if args.get(k) is None})


		strings = { 

			# Miscellaneous Variables
			**{
			'complexity_':r'$N_{\textrm{coefficients}}$',
			'coef_':r'$\abs{\gamma}$',
			'loss':r'$\textrm{RMSE}$', 
			'State': r'$\textrm{State}$',			
			},



			# Root Variables
			**{_DELIMETER.join(['%s','%s','%d'])%(y,args['root'],i):r'${%s}_{%d}$'%(args['outputs'][y],i) for y in args['outputs'] for i in args['iloc']},

			# Inputs and Outputs
			**{x:r'$%s$'%(args['inputs'][x]) for x in args['inputs']},
			**{y:r'$%s$'%(args['outputs'][y]) for y in args['outputs']},



			# Inputs polynomial
			**({'%s'%('_'.join(['%s_%d'%(x,i) 
				for x,i in zip(natsorted(args['inputs']),I)])):r'%s'%(' '.join([r'$({%s})^{%d}$'%(args['inputs'][x],i) 
				for x,i in zip(natsorted(args['inputs']),I)])) 
				for I in itertools.product(list(range(args['basis']+1)),repeat=len(args['inputs']))}
				if args['iter']['polynomial'] else {}),


			# Outputs polynomial
			**({'%s'%('_'.join(['%s_%d'%(y,i) 
				for y,i in zip(natsorted(args['outputs']),I)])):r'%s'%(' '.join([r'$({%s})^{%d}$'%(args['outputs'][y],i) 
				for y,i in zip(natsorted(args['outputs']),I)])) 
				for I in itertools.product(list(range(args['basis']+1)),repeat=len(args['outputs']))}			
				if args['iter']['polynomial'] else {}),


			# Inputs monomial
			**{'%s_%d'%(x,i) : r'$({%s})^{%d}$'%(args['inputs'][x],i) for x in args['inputs'] for i in range(0,args['basis']+1)},					

			# Outputs monomial
			**{'%s_%d'%(y,i) : r'$({%s})^{%d}$'%(args['outputs'][y],i) for y in args['outputs'] for i in range(0,args['basis']+1)},					


			# Outputs for Nops
			**{'%s__%d'%(y,i) : r'${%s}^{(%d)}$'%(args['outputs'][y],args['Nops']-i) for y in args['outputs'] for i in range(args['Nops'])},		


			# Inputs and Outputs (with delimeter)
			**{'__%s'%x:r'$%s$'%(args['inputs'][x]) for x in args['inputs']},
			**{'__%s'%y:r'$%s$'%(args['outputs'][y]) for y in args['outputs']},

			# nth Derivative monomial (No Expansion)
			**({_DELIMETER.join(['%s','%d','%s','%s','%s'])%(_DELIMETER.join([m]*j),j,y,_DELIMETER.join([v for v in x]),_DELIMETER.join([d]*j)) : r'$\frac{\delta^{%s} %s}{%s}$'%(str(j) if j>1 else '',args['outputs'][y],
										' '.join([r'\delta %s'%(args['inputs'][v]) for v in x]) if len(set([v for v in x]))>1 else r'{\delta %s}^{%s}'%(args['inputs'][[v for v in x][0]],str(len(x)) if len(x)>1 else ''))
				 for m in args['methods']
				 for j in range(1,args['order']+1) 
				 for d in args['metrics']
				 for y in args['outputs']
				 for x in itertools.product([v for v in args['inputs']],repeat=j)
				}
				if args['iter']['taylorseries'] else {}),

			# nth Derivative monomial (Expansion)
			**({_DELIMETER.join(['%s','%s','%d','%s','%s','%s','%s'])%(_DELIMETER.join([y,args['root'],str(i)]),_DELIMETER.join([m]*j),j,y,_DELIMETER.join([v for v in x]),_DELIMETER.join([d]*j),_DELIMETER.join([v for v in x])) : r'$\frac{\delta^{%s} %s}{%s}$'%(str(j) if j>1 else '',args['outputs'][y],
										' '.join([r'\delta %s'%(args['inputs'][v]) for v in x]) if len(set([v for v in x]))>1 else r'{\delta %s}^{%s}'%(args['inputs'][[v for v in x][0]],str(len(x)) if len(x)>1 else ''))
				 for i in args['iloc']
				 for m in args['methods']
				 for j in range(1,args['order']+1) 
				 for d in args['metrics']
				 for y in args['outputs']
				 for x in itertools.product([v for v in args['inputs'] if v not in args['constants'].get(y,[])],repeat=j)
				 }
				if args['iter']['taylorseries'] else {}),              
			}


		strings.update(texstrings)



		self.args = args
		self.strings  = strings
		self.usetex = usetex


		return
	 
	def texify(self,string,texstrings={},texargs={},usetex=True,quiet=True):


		def is_number(s):
			try:
				s = float(s)
				return True
			except:
				try:
					s = int(s)
					return True
				except:
					return False


		self.args.update(texargs)
		self.strings.update(texstrings)    
		usetex = usetex if self.usetex is None else self.usetex

		String = ""
		if not isinstance(string,tuple):
		   string = (str(string),)

		string = list(((str(s) for s in string)))



		for s in string:
			# print('string',s)
			# print("-------TRYING --- ",usetex,string,s,self.strings.get(s)) #s)
			if usetex:
				if isinstance(s,float):
					s = r'$%0.3e$'%s
				elif isinstance(s,int):
					s = r'$\textrm{%d}$'%s
				else:
					s = str(s)
			else:
				s = str(s)


			if (0 or not quiet) and (s not in self.strings):
				# x = {'%s__%s__ROOT__grad__1__%s__E11__frobenius__E11__grad__1__%s__E12__frobenius__E12__grad__1__%s__E22__frobenius__E22__grad__1__%s__vol_rectangle_m__frobenius__vol_rectangle_m__grad__1__%s__vol_rectangle_p__frobenius__vol_rectangle_p__grad__1__%s__vol_square__frobenius__vol_square__grad__grad__2__%s__E11__E11__frobenius__frobenius__E11__E11__grad__grad__2__%s__E11__E12__frobenius__frobenius__E11__E12__grad__grad__2__%s__E11__E22__frobenius__frobenius__E11__E22__grad__grad__2__%s__E11__vol_rectangle_m__frobenius__frobenius__E11__vol_rectangle_m__grad__grad__2__%s__E11__vol_rectangle_p__frobenius__frobenius__E11__vol_rectangle_p__grad__grad__2__%s__E11__vol_square__frobenius__frobenius__E11__vol_square__grad__grad__2__%s__E12__E11__frobenius__frobenius__E12__E11__grad__grad__2__%s__E12__E12__frobenius__frobenius__E12__E12__grad__grad__2__%s__E12__E22__frobenius__frobenius__E12__E22__grad__grad__2__%s__E12__vol_rectangle_m__frobenius__frobenius__E12__vol_rectangle_m__grad__grad__2__%s__E12__vol_rectangle_p__frobenius__frobenius__E12__vol_rectangle_p__grad__grad__2__%s__E12__vol_square__frobenius__frobenius__E12__vol_square__grad__grad__2__%s__E22__E11__frobenius__frobenius__E22__E11__grad__grad__2__%s__E22__E12__frobenius__frobenius__E22__E12__grad__grad__2__%s__E22__E22__frobenius__frobenius__E22__E22__grad__grad__2__%s__E22__vol_rectangle_m__frobenius__frobenius__E22__vol_rectangle_m__grad__grad__2__%s__E22__vol_rectangle_p__frobenius__frobenius__E22__vol_rectangle_p__grad__grad__2__%s__E22__vol_square__frobenius__frobenius__E22__vol_square__grad__grad__2__%s__vol_rectangle_m__E11__frobenius__frobenius__vol_rectangle_m__E11__grad__grad__2__%s__vol_rectangle_m__E12__frobenius__frobenius__vol_rectangle_m__E12__grad__grad__2__%s__vol_rectangle_m__E22__frobenius__frobenius__vol_rectangle_m__E22__grad__grad__2__%s__vol_rectangle_m__vol_rectangle_m__frobenius__frobenius__vol_rectangle_m__vol_rectangle_m__grad__grad__2__%s__vol_rectangle_m__vol_rectangle_p__frobenius__frobenius__vol_rectangle_m__vol_rectangle_p__grad__grad__2__%s__vol_rectangle_m__vol_square__frobenius__frobenius__vol_rectangle_m__vol_square__grad__grad__2__%s__vol_rectangle_p__E11__frobenius__frobenius__vol_rectangle_p__E11__grad__grad__2__%s__vol_rectangle_p__E12__frobenius__frobenius__vol_rectangle_p__E12__grad__grad__2__%s__vol_rectangle_p__E22__frobenius__frobenius__vol_rectangle_p__E22__grad__grad__2__%s__vol_rectangle_p__vol_rectangle_m__frobenius__frobenius__vol_rectangle_p__vol_rectangle_m__grad__grad__2__%s__vol_rectangle_p__vol_rectangle_p__frobenius__frobenius__vol_rectangle_p__vol_rectangle_p__grad__grad__2__%s__vol_rectangle_p__vol_square__frobenius__frobenius__vol_rectangle_p__vol_square__grad__grad__2__%s__vol_square__E11__frobenius__frobenius__vol_square__E11__grad__grad__2__%s__vol_square__E12__frobenius__frobenius__vol_square__E12__grad__grad__2__%s__vol_square__E22__frobenius__frobenius__vol_square__E22__grad__grad__2__%s__vol_square__vol_rectangle_m__frobenius__frobenius__vol_square__vol_rectangle_m__grad__grad__2__%s__vol_square__vol_rectangle_p__frobenius__frobenius__vol_square__vol_rectangle_p__grad__grad__2__%s__vol_square__vol_square__frobenius__frobenius__vol_square__vol_square__None__None__None__None__%s__%s__0__%d'%tuple([k[0],*[k[0]]*(args['Nops']),n,c,i]):r'$%s^{(%d)}$'%(k[1],args['Nops']-i) for k in [('Psi_me',r'\Psi_{\textrm{me}}'),('Psi',r'\Psi')] for i in range(args['Nops']) for n in args['normalizations'] for c in args['stepwise_methods']}
				# for xi,yi in x.items():
				#     if xi.endswith('13'):
				#         print('ex',xi)
				#         print()
				# if s.startswith('grad'):
				print('texify',s)
				pass


			if usetex:
				# if any([bool(re.search(s,k)) for k in self.strings]):
				if not (is_number(s) or any([t in s for t in ['$','textrm','_','^','\\']])):
					s = self.strings.get(s,r'$\textrm{%s}$'%s)
				else:
					if s in self.strings:
						s = self.strings.get(s)
					elif _DELIMETER in s:
						# s = _DELIMETER.join([s.split(_DELIMETER)[i] for i in [0,-1]]) 
						for y in self.args['outputs']:
							if s.startswith(y):
								s = _DELIMETER.join([y,s.split(_DELIMETER)[-1]])
								break
						# print("split????",s)
						s = self.strings.get(s,s)
						# print('dotnspline---',s)
					else:
						s = self.strings.get(s,s)					
				for t in ['_','^']:
					s = s.split(t)
					s = [r'\textrm{%s}'%i  if (not (is_number(i) or any([j in i for j in ['$','textrm','_','^','\\']]))) else i for i in s]
					s = t.join(['{%s}'%i for i in s])
					# s = r'%s%s'%(t.join([r'{{%s}'%i for i in s]),'}'*len(s))
			else:
				s = self.strings.get(s,s)
				s = s.split("__")
				for _s in s:
					if len(_s)>0:
						s = _s
						break
				s = s[:10]
			# print(s,usetex)
			for k in ['quench']:
				t = s.split('/')
				for i in t:
					if k in i:
						for l in ['-','_']:
							i = i.split(l)[-1]
						s = i
						break
						  
			# if len(s)> 100:
			#   s = s.split('_')[0]


			if usetex:
				s = s.replace(r'\\\\','\\\\')

			s = s.replace(_DELIMETER,'')
			# print('adding s',s)
			if String == "":
				String = s
			else:
				String = '%s - %s'%(String,s)

			# print('TEXIFY: ',String,s)
		if usetex:
			String = r'$%s$'%(String.replace('$',''))
		else:
			String = r'%s'%(String.replace('$',''))
		return String    
