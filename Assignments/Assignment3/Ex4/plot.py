#!/usr/bin/env python

# Import python modules
import os,sys,copy,warnings,itertools,inspect
import json,glob
import numpy as np
import pandas as pd

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
		
from texify import Texify

warnings.simplefilter("ignore", (UserWarning,DeprecationWarning,FutureWarning))

# Update nested elements
def _update(iterable,elements,_append=True,_copy=False,_clear=True,_reset=True):
	if _clear and elements == {}:
		print('clearning')
		iterable.clear()
	for e in elements:
		try:
			if (not _reset) and (e in iterable):
				pass
			elif _append and isinstance(iterable.get(e),dict):
				# print('tryeing',e,elements[e])
				_update(iterable[e], elements[e],_append=_append,_copy=_copy,_clear=_clear,_reset=_reset)
			else:
				copier = copy.deepcopy if _copy else (lambda x:x)
				iterable.update({e:copier(elements[e])})
		except:
			pass
	return



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

# Plot data - General plotter
def plot(x=None,y=None,settings={},fig=None,axes=None,mplstyle=None,texify=None):

	AXIS = ['x','y','z']
	LAYOUT = ['nrows','ncols','index']
	DIM = 2

	def _layout(settings):
		if isinstance(settings,(list,tuple)):
			return dict(zip(LAYOUT,settings))
		_layout_ = {}
		if all([k in settings for k in ['pos']]):
			pos = settings.pop('pos')
			if pos not in [None]:
				pos = str(pos)
				_layout_ = {k: int(pos[i]) for i,k in zip(range(len(pos)),LAYOUT)}
		elif all([k in settings and settings.get(k) not in [None] for k in LAYOUT]):
			_layout_ = {k: settings[k] for k in LAYOUT}
		if _layout_ != {}:
			settings.update(_layout_)
		else:
			settings.clear()
		return _layout_

	def _position(layout):
		if all([s == t for s,t in zip(LAYOUT,['nrows','ncols'])]):
			position = ((((layout['index']-1)//layout['ncols'])%layout['nrows'])+1,((layout['index']-1)%layout['ncols'])+1)
		else:
			position = (1,1)
		return position

	def _positions(layout):
		if all([s == t for s,t in zip(LAYOUT,['nrows','ncols'])]):
			positions = {
				'top':(1,None),'bottom':(layout['nrows'],None),
				'left':(None,1),'right':(None,layout['ncols']),
				'top_left':(1,1),'bottom_right':(layout['nrows'],layout['ncols']),
				'top_right':(1,layout['ncols']),'bottom_left':(layout['nrows'],1),
				}
		else:
			positions = {
				'top':(1,None),'bottom':(1,None),
				'left':(None,1),'right':(None,1),
				'top_left':(1,1),'bottom_right':(1,1),
				'top_right':(1,1),'bottom_left':(1,1),
				}
		return positions


	def layout(key,fig,axes,settings):
		if key in axes:
			return
		_layout_ = _layout(settings[key]['style']['layout']);
		add_subplot = True and (_layout_ != {})
		for k in axes:
			__layout__ = _layout(settings.get(k,{}).get('style',{}).get('layout',axes[k].get_geometry()));
			if all([_layout_[s]==__layout__[s] for s in _layout_]):
				axes[key] = axes[k]
				add_subplot = False
				break
		if add_subplot:
			args = [_layout_.pop(s) for s in LAYOUT]
			gs = gridspec.GridSpec(*args[:DIM])
			axes[key] = fig.add_subplot(list(gs)[args[-1]-1],**_layout_)
		return

	def attr_texify(string,attr,kwarg,texify,**kwargs):
		def texwrapper(string):
			s = string.replace('$','')
			if not any([t in s for t in [r'\textrm','_','^','\\']]):
				s = r'\textrm{%s}'%s
			for t in ['_','^']:
				s = s.split(t)
				s = [r'\textrm{%s}'%i  if (not (is_number(i) or any([j in i for j in ['$','textrm','_','^','\\']]))) else i for i in s]
				s = t.join(['{%s}'%i for i in s])
			s = r'$%s$'%(s)
			return s
		attrs = {
			**{'set_%slabel'%(axis):['%slabel'%(axis)]
				for axis in AXIS},
			# **{'set_%sticks'%(axis):['ticks']
			# 	for axis in AXIS},				
			**{'set_%sticklabels'%(axis):['labels']
				for axis in AXIS},								
			**{'set_title':['label'],'suptitle':['t'],
			'plot':['label'],'scatter':['label'],
			'annotate':['s'],
			'legend':['title']},
		}
		if texify is None:
			texify = texwrapper
		elif isinstance(texify,dict):
			Tex = Texify(**texify)
			texify = Tex.texify
			texify = lambda string,texify=texify: texwrapper(texify(string))


		if attr in attrs and kwarg in attrs[attr]:
			if isinstance(string,(str,tuple)):
				string = texify(string)
			elif isinstance(string,list):
				string = [texify(s) for s in string]
		return string


	def attr_share(string,attr,kwarg,share,**kwargs):
		
		attrs = {
			**{'set_%s'%(key):['%s'%(label)]
				for axis in AXIS 
				for key,label in [('%slabel'%(axis),'%slabel'%(axis)),
								  ('%sticks'%(axis),'ticks'),
								  ('%sticklabels'%(axis),'labels')]},
			**{'set_title':['label'],'suptitle':['t'],
			'plot':['label'],'scatter':['label'],
			'annotate':['s'],
			'legend':['handles','labels','title']},
		}					

		if ((attr in attrs) and (attr in share) and (kwarg in attrs[attr]) and (kwarg in share[attr])):
			share = share[attr][kwarg]
			if ((share is None) or 
				(not all([(k in kwargs and kwargs[k] is not None) 
					for k in ['layout']]))):
				return string
			elif (not share) and (share is not None):
				if isinstance(string,list):
					return []
				else:
					return None     
			else:
				_position_ = _positions(kwargs['layout'])[share]
				position = _position(kwargs['layout'])
				if all([((_position_[i] is None) or (position[i]==_position_[i])) for i in range(DIM)]):
					return string
				else:
					if isinstance(string,list):
						return []
					else:
						return None     
		else:
			return string
		return

	def attr_wrap(obj,attr,settings,**kwargs):

		def attrs(obj,attr,**kwargs):
			call = True
			args = []
			if attr in ['legend']:
				handles,labels = getattr(obj,'get_legend_handles_labels')()
				# kwargs.update({k: attr_share(attr_texify(v,attr,k,**kwargs),attr,k,**kwargs)  
				# 		for k,v in zip(['handles','labels'],
				# 						getattr(obj,'get_legend_handles_labels')())
				# 		})
				if handles == [] or all([kwargs[k] is None for k in kwargs]):
					call = False
				else:
					kwargs.update(dict(zip(['handles','labels'],
									getattr(obj,'get_legend_handles_labels')())))
			
			elif attr in ['plot','scatter']:
				args.extend([kwargs.pop(k) for k in ['x','y'] if kwargs.get(k) is not None])

			elif attr in ['set_%smajor_formatter'%(axis) for axis in AXIS]:
				axis = attr.replace('set_','').replace('major_formatter','')
				for k in kwargs:
					getattr(getattr(obj,'get_%saxis'%(axis))(),'set_major_formatter')(
						getattr(getattr(matplotlib,k),kwargs[k])())
				call = False

			elif attr in ['set_%snbins'%(axis) for axis in AXIS]:
				axis = attr.replace('set_','').replace('nbins','')
				getattr(getattr(obj,'%saxis'%(axis)),'set_major_locator')(
					getattr(plt,'MaxNLocator')(**kwargs))
				call = False

			elif attr in ['set_%soffsetText_fontsize'%(axis) for axis in AXIS]:
				axis = attr.replace('set_','').replace('offsetText_fontsize','')
				getattr(getattr(getattr(obj,'%saxis'%(axis)),'offsetText'),'set_fontsize')(**kwargs)
				call = False

				
			if not call:	
				return
			# try:  
			if args != []:
				getattr(obj,attr)(args[0],args[1],**kwargs)
			else:
				getattr(obj,attr)(**kwargs)
					
			# except:
			# 	_kwargs = inspect.getfullargspec(getattr(obj,attr))[0]
			# 	args.extend([kwargs[k] for k in kwargs if k not in _kwargs])
			# 	kwargs = {k:kwargs[k] for k in kwargs if k in _kwargs}
			# 	try:
			# 		getattr(obj,attr)(*args,**kwargs)
			# 	except:
			# 		pass
			return

		_kwargs = []
		_wrapper = lambda kwarg,attr,**kwargs:{k: attr_share(attr_texify(kwarg[k],attr,k,**kwargs),attr,k,**kwargs) for k in kwarg}

		if isinstance(settings,list):
			_kwargs.extend(settings)
		elif isinstance(settings,dict):
			_kwargs.append(settings)
		else:
			return
		for _kwarg in _kwargs:
			attrs(obj,attr,**_wrapper(_kwarg,attr,**kwargs))
		return

	def obj_wrap(attr,key,fig,axes,settings):
		attr_kwargs = lambda attr,key,settings:{
			'texify':settings[key]['style'].get('texify'),
			'share':settings[key]['style'].get('share',{}).get(attr,[]),
			'layout':_layout(settings[key]['style'].get('layout',{})),
			}	
		
		matplotlib.rcParams.update(settings[key]['style'].get('rcParams',{}))

		objs = lambda attr,key,fig,axes: {'fig':fig,'ax':axes.get(key)}[attr]
		obj = objs(attr,key,fig,axes)

		if obj is not None:
			for prop in settings[key][attr]:
				attr_wrap(obj,prop,settings[key][attr][prop],**attr_kwargs(attr,key,settings))
		return
		
		
	

	def setup(x,y,settings,fig,axes,mplstyle,texify):
		def _setup(settings,_settings):
			_update(settings,_settings)
			return
		def _index(i,N,method='row'):
			
			if method == 'row':
				return [1,N,i+1]
			if method == 'col':
				return [N,1,i+1]				
			elif method == 'grid':
				M = int(np.sqrt(N))+1
				return [M,M,i+1]
			else:
				return [1,N,i+1]


		_defaults = {None:{}}
		defaults = {'ax':{},'fig':{},'subplot':{},'style':{}}

		if isinstance(settings,str):
			with open(settings,'r') as file:
				settings = json.load(file)
		
		update = y is not None

		if not isinstance(y,dict):
			y = {key: y for key in settings}

		if not isinstance(x,dict):
			x = {key: x for key in settings}
	

		if any([key in settings for key in defaults]):
			settings = {key:copy.deepcopy(settings) for key in y}


		for i,key in enumerate(y):
			if not isinstance(settings[key]['style'].get('layout'),dict):
				settings[key]['style']['layout'] = {}
			if not all([s in settings[key]['style']['layout'] for s in LAYOUT]):
				settings[key]['style']['layout'].update(dict(zip([*LAYOUT[:DIM],LAYOUT[-1]],_index(i,len(y),'grid'))))
		
		if update:		
			for i,key in enumerate(y):
				_settings = {
					'ax':{'plot':{'x':x.get(key),'y':y[key]}},
					'style':{'layout':{s:settings[key]['style'].get('layout',{}).get(s,1) 
						for s in LAYOUT}}
					}

				_setup(settings[key],_settings)		

		for key in settings:
			settings[key].update({k:defaults[k] 
				for k in defaults if k not in settings[key]})


		if fig is None:
			fig = plt.figure()
		if axes is None:
			axes = {}
		
		for key in settings:
			attr = 'layout'
			layout(key,fig,axes,settings)

			attr = 'style'
			for prop,obj in zip(['mplstyle','texify'],[mplstyle,texify]):
				settings[key][attr][prop] = settings[key][attr].get(prop,obj)

		return settings,fig,axes


	mplstyles = [mplstyle,
				os.path.join(os.path.dirname(os.path.abspath(__file__)),'plot.mplstyle'),
				matplotlib.matplotlib_fname()]

	for mplstyle in mplstyles:
		if mplstyle is not None and os.path.isfile(mplstyle):
			break

	with matplotlib.style.context(mplstyle):

		settings,fig,axes = setup(x,y,settings,fig,axes,mplstyle,texify)
		
		for key in settings:
			for attr in ['ax','fig']:
				obj_wrap(attr,key,fig,axes,settings)


	return fig,axes



if __name__ == "__main__":
	try:
		data = sys.argv[1]
		path = sys.argv[2]
		settings = sys.argv[3]
		mplstyle = sys.argv[4]
		Y = sys.argv[5].split(' ')
		X = sys.argv[6].split(' ')


		df = pd.concat([pd.read_csv(d) for d in glob.glob(data)],
							axis=0,ignore_index=True)

		with open(settings,"r") as f:
			_settings = json.load(f)

		settings = {}

		for i,(x,y) in enumerate(zip(X,Y)):
			key = y

			settings[key] = copy.deepcopy(_settings)

			settings[key]['ax']['plot']["x"] = df[x].values if x in df else df.index.values
			settings[key]['ax']['plot']["y"] = df[y].values if y in df else df.index.values
			settings[key]['ax']['set_xlabel'] = {"xlabel":x.capitalize() if x in df else None}
			settings[key]['ax']['set_ylabel'] = {"ylabel":y.capitalize() if y in df else None }
			settings[key]['style']['layout'] = {"ncols":len(Y),"nrows":1,"index":i}
			settings[key]['fig']['savefig'] = {"fname":path,"bbox_inches":"tight"}

		fig,axes = plot(settings=settings,mplstyle=mplstyle) 
	except:
		exit();