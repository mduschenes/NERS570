#!/usr/bin/env python
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rcParams['text.usetex'] = True
# matplotlib.rcParams['text.latex.preamble'] = [r'\usepackage{ragged2e']

# Routine modified from: https://stackoverflow.com/questions/1094841/reusable-library-to-get-human-readable-version-of-file-size
def sizeof_fmt(num, suffix='B'):
    for unit in ['','K','M','G','T']:
        if abs(num) < 1024.0:
            return '%3.0f%s%s' % (num, unit, suffix)
        num /= 1024.0
    return '%.1f%s%s' % (num, 'T', suffix)

def fmt_sizeof(fmt):
    bases={'B':2,'':10}
    units={k:v for k,v in zip(['','K','M','G','T'],[1,10,20,30,40])}
    try:
      base=fmt[-1]
      unit=fmt[-2]
      num = float(fmt[:-2])
    except ValueError:
      try:
        base=fmt[-1]
        unit=''
        num = float(fmt[:-1])
      except:
        try:
          base=''
          unit=''
          num = float(fmt)
        except:
          return fmt
    # print(num,(bases.get(base,10)**units.get(unit,1)))
    # print(num)
    num *= (bases.get(base,10)**units.get(unit,1))
    if int(num) == num:
      num = int(num)
    return num

def indexer(array,sorter,value):
  i = np.where(sorter==value)[0]
  return array[i]


file='membench_4'
cpuspeed=3e9

mbdata = np.genfromtxt('%s.out'%file,usecols=(1,3,5))


maxunit=10
units=dict(zip(range(0,maxunit*4,maxunit),['','K','M','G']))
sizes = {'%d%s%s'%(b**(i),units[d],u):b**(i+d) for b,u in zip([2],['B']) for d in units for i in range(maxunit)}


xtlabels=[*['4B','16B','64B','256B','1KB','4KB','16KB','64KB','256KB','1MB'],
          *['2MB','4MB','8MB','16MB','32MB','64MB','128MB','256MB','512MB','2GB']]
xtvals = [sizes.get(l,fmt_sizeof(l)) for l in xtlabels]





# k,l,m = '1GB','1MB','512B'
# print((sizes.get(k,fmt_sizeof(k)),indexer(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))),indexer(mbdata[:,1],mbdata[:,0],sizes.get(l,fmt_sizeof(l))),sizes.get(m,fmt_sizeof(m)))[0]))

lims={
       'all':[(xtlabels[0],xtlabels[-1]),(-2,16)],
       'lowerleft':[('4B','8KB'),(-2,1)],
       'middleupper':[('16B','64KB'),(6,12)],
       'middle':[('64B','64MB'),(1,4)],
       }

heights={k:{l:-1 for l in ['h','v']} for k in lims}
heights['all']['v'] =15
heights['lowerleft']['v'] = -1
heights['middle']['v'] = 2.5
heights['middleupper']['v'] = 11
lines={
        'all':{'v': {
                     # **{(sizes.get(k,fmt_sizeof(k))/2,height):r'$\tilde{L}_{1,2,3}\\\textrm{%s}$'%k for i,k in enumerate(['64B'])},
                     # **{(sizes.get(k,fmt_sizeof(k)),height):r'${L}_{%d}\\\textrm{%s}$'%(i+1,k) for i,k in enumerate(['128B'])},
                     # # **{(sizes.get(k,fmt_sizeof(k)),height):r'$\tilde{L}_{%d}$'%(i+1) for i,k in enumerate(['128B','4KB','16KB'])},
                     # **{(sizes.get(k,fmt_sizeof(k)),height):r'$\tilde{L}_{%d}\\\textrm{%s}$'%(i+1,k) for i,k in enumerate(['32KB','1MB','24.75MB'])},

                     **{(sizes.get(k,fmt_sizeof(k)),heights['all']['v']-1):r'$\tilde{L}_{1,2,3}$' for i,k in enumerate(['64B'])},
                     **{(sizes.get(k,fmt_sizeof(k)),heights['all']['v']):r'${L}_{%d}$'%(i+1) for i,k in enumerate(['64B','512B','4KB'])},
                     # **{(sizes.get(k,fmt_sizeof(k)),heights['all']['v']):r'$\tilde{L}_{%d}$'%(i+1) for i,k in enumerate(['128B','4KB','16KB'])},
                     **{(sizes.get(k,fmt_sizeof(k)),heights['all']['v']-1):r'$\tilde{L}_{%d}$'%(i+1) for i,k in enumerate(['32KB','1MB','25MB'])},                     
                     **{(sizes.get(k,fmt_sizeof(k)),heights['all']['v']):r'$L_{%d}$'%(i+1) for i,k in enumerate(['16KB','256KB','8MB'])},                     
                     },

              'h': {
                    # **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['1GB'],['32KB']))},
                    **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) if i<3 else r'$T_{\textrm{mem}}$' for i,(k,l) in enumerate(zip(['1GB','1GB','1GB','1GB'],['32KB','1MB','256MB','1GB']))},
                    # **{(sizes.get(k,fmt_sizeof(k)),indexer(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))),indexer(mbdata[:,1],mbdata[:,0],sizes.get(l,fmt_sizeof(l))),sizes.get(m,fmt_sizeof(m)))[0]):r'$T_{%d}$'%(i+2) for i,(k,l,m) in enumerate(zip(['1GB'],['1MB'],['512B']))},
                    },


                        
              },
        'lowerleft':{'v': {
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'$\tilde{L}_{1,2,3}\\\textrm{%s}$'%k for i,k in enumerate(['64B'])},
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'${L}_{%d}\\\textrm{%s}$'%(i+1,k) for i,k in enumerate(['128B'])},

                            **{(sizes.get(k,fmt_sizeof(k)),heights['lowerleft']['v']-0.5):r'$\tilde{L}_{1,2,3}$' for i,k in enumerate(['64B'])},
                            **{(sizes.get(k,fmt_sizeof(k)),heights['lowerleft']['v']):r'${L}_{%d}$'%(i+1) for i,k in enumerate(['64B','512B','4KB'])},
                          

                          },
                    'h': {
                          # **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['256B'],['32KB']))},
                    **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['4KB','4KB'],['32KB','1MB']))},
                          },
                    },
        'middle':{'v': {
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'$\tilde{L}_{1,2,3}\\\textrm{%s}$'%k for i,k in enumerate(['64B'])},
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'${L}_{%d}\\\textrm{%s}$'%(i+1,k) for i,k in enumerate(['128B'])},

                            **{(sizes.get(k,fmt_sizeof(k)),heights['middle']['v']-0.5):r'$\tilde{L}_{1,2,3}$' for i,k in enumerate(['64B'])},
                            **{(sizes.get(k,fmt_sizeof(k)),heights['middle']['v']):r'${L}_{%d}$'%(i+1) for i,k in enumerate(['64B','512B','4KB'])},
                            **{(sizes.get(k,fmt_sizeof(k)),heights['middle']['v']-1):r'$\tilde{L}_{%d}$'%(i+1) for i,k in enumerate(['32KB','1MB','25MB'])},                     
                             **{(sizes.get(k,fmt_sizeof(k)),heights['middle']['v']):r'$L_{%d}$'%(i+1) for i,k in enumerate(['16KB','256KB','8MB'])},                     
                          },
                    'h': {
                          # **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['256B'],['32KB']))},
                    **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['16MB','16MB'],['32KB','1MB']))},
                          },
                    },  
        'middleupper':{'v': {
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'$\tilde{L}_{1,2,3}\\\textrm{%s}$'%k for i,k in enumerate(['64B'])},
                            # **{(sizes.get(k,fmt_sizeof(k)),height):r'${L}_{%d}\\\textrm{%s}$'%(i+1,k) for i,k in enumerate(['128B'])},

                            **{(sizes.get(k,fmt_sizeof(k)),heights['middleupper']['v']-0.5):r'$\tilde{L}_{1,2,3}$' for i,k in enumerate(['64B'])},
                            **{(sizes.get(k,fmt_sizeof(k)),heights['middleupper']['v']):r'${L}_{%d}$'%(i+1) for i,k in enumerate(['64B','512B','4KB'])},
                            **{(sizes.get(k,fmt_sizeof(k)),heights['middleupper']['v']-1):r'$\tilde{L}_{%d}$'%(i+1) for i,k in enumerate(['32KB','1MB','25MB'])},                     
                             **{(sizes.get(k,fmt_sizeof(k)),heights['middleupper']['v']):r'$L_{%d}$'%(i+1) for i,k in enumerate(['16KB','256KB','8MB'])},                     
                          },
                    'h': {
                          # **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['256B'],['32KB']))},
                    **{(sizes.get(k,fmt_sizeof(k)),np.max(indexer(mbdata[:,2],mbdata[:,0],sizes.get(l,fmt_sizeof(l))))):r'$T_{%d}$'%(i+1) for i,(k,l) in enumerate(zip(['16MB','16MB','32KB'],['32KB','1MB','256MB']))},
                          },
                    },  
        # 'middle':{'v': {**{(sizes.get(k,fmt_sizeof(k)),-4.5):'L%d\\LineSize:\\%s'%(i+1,k) for i,k in enumerate(['4KB','16KB'])}}}
      }




print(lines)


cmap = 'tab20b'
lengths=np.array(list(sorted(set(mbdata[:,0]))))

kwargs={}
kwargs['marker']  = ['.','*','^','s','d','+','']

kwargs['color'] = {k:v for k,v in zip(lengths,plt.get_cmap(cmap)(np.linspace(0, 1, len(lengths))).tolist())}
kwargs['label'] = {k:'L=%s'%(sizeof_fmt(k)) for k in lengths }

kwargs['marker'] = {k: kwargs['marker'][i%len(kwargs['marker'])] for i,k in enumerate(lengths)}
kwargs['inds'] = {k: np.where(mbdata[:,0]==k)[0] for k in lengths}



kwargs['lines'] = {k: {'linestyle':s,'color':c,'label':l,'alpha':a,'zorder':z} for k,l,c,s,a,z in zip(
                                                                              ['tilde{L}_{1,2,3}','tilde{L}','{L}_','L_','T_','Mem',None],
                                                                              ['True Line Size','True Cache Size','Line Size','Cache Size','Access Time','Access Time',''],
                                                                              ['k','b','k','b','g','g',None],
                                                                              ['--','--','-','-','-','-',None],
                                                                              [0.6,0.6,0.8,0.8,0.8,0.8,None],
                                                                              [-1,-1,10,10,10,10,None],
                                                                              )}

for lim in lims:


  fig,ax = plt.subplots()

  # Plots
 
  #for i in range(9,27):
  for L in lengths:
    #ax.plot(mbdata[istt:istt+i,1],mbdata[istt:istt+i,2],
    ax.plot(mbdata[kwargs['inds'][L],1],mbdata[kwargs['inds'][L],2],**{k:kwargs[k][L] for k in ['color','marker','label']})
    #istt=istt+i+1

  ax.set_ylabel('Time (nsec)')
  ax.set_xlabel('Stride (bytes)')
  ax.set_xscale('log',base=2)
  ax.set_xticks(xtvals)
  ax.set_xticklabels(xtlabels,rotation=45)
  ax.set_ylim(*[l for l in lims[lim][1]])
  ax.set_xlim(*[sizes.get(l,fmt_sizeof(l)) for l in lims[lim][0]])

  # Lines
  plotlines={k:lambda line,k=k,i=i,**kwargs: getattr(ax,'ax%sline'%k)(line[i],**kwargs) for i,k in enumerate(['v','h'])}
  annotatelines={k:lambda line,text,k=k,i=i,**kwargs: getattr(plt,'annotate')(text=text,xy=line,**kwargs) for i,k in enumerate(['v','h'])}
  for k in lines.get(lim,[]):
    plotline=plotlines[k]
    annotateline=annotatelines[k]
    for line in lines[lim][k]:
      text = lines[lim][k][line]
      _kwargs = kwargs['lines'][None]      
      for x in kwargs['lines']:
        if str(x) in text:
          _kwargs = kwargs['lines'][x]
          break
      textline=list(line)
      if 0 and (_kwargs['color'] == 'k' and _kwargs['linestyle'] == '-'):
        textline[0] /=8
      elif (_kwargs['color'] == 'g') and (lim=='all'):
        textline[1] += 0.25
      elif (_kwargs['color'] == 'g') and (lim=='lowerleft'):
        textline[1] += 0.1
      elif (_kwargs['color'] == 'g') and (lim=='middle'):
        textline[0] *= 1.5        
        textline[1] += 0.06
      elif (_kwargs['color'] == 'g') and (lim=='middleupper'):
        textline[0] *= 1.2        
        textline[1] += 0.1                
      elif lim not in ['lowerleft']:
        textline[0] *= 1.15
      else:
        textline[0] *= 1.15        
      # if lim == 'lowerleft':
      #   textline[1] = -0.5

      plotline(line,**_kwargs)
      annotateline(textline,text)

  handles,labels = ax.get_legend_handles_labels()
  handles,labels = [h for i,(h,l) in enumerate(zip(handles,labels)) if l not in labels[:i]],[l for i,(h,l) in enumerate(zip(handles,labels)) if l not in labels[:i]]
  fig.legend(handles=handles,labels=labels,bbox_to_anchor=(0.7,0.5),loc='center left',ncol=2,prop = {"size": 6},)
  fig.subplots_adjust(right=0.7,bottom=0.15)
  fig.savefig('../../figures/%s_%s.pdf'%('_'.join(file.split('_')[:-1]),lim))

