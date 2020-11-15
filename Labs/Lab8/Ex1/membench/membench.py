#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

# Routine modified from: https://stackoverflow.com/questions/1094841/reusable-library-to-get-human-readable-version-of-file-size
def sizeof_fmt(num, suffix='B'):
    for unit in ['','K','M','G','T']:
        if abs(num) < 1024.0:
            return "%3.0f%s%s" % (num, unit, suffix)
        num /= 1024.0
    return "%.1f%s%s" % (num, 'T', suffix)



file='membench_2'

mbdata = np.genfromtxt("%s.out"%file,usecols=(1,3,5))

plt.ylabel("Time (nsec)")
plt.xlabel("Stride (bytes)")
plt.xscale("log",base=2)
# plt.ylim(-1,1)#
plt.ylim(-1,np.ceil(max(mbdata[:,2]))+1)
xtvals=np.concatenate([np.power(4,range(1,11)), np.power(2,range(21,30))])
xtlabels=["4B",
         "16B",
         "64B",
        "256B",
          "1K",
          "4K",
         "16K",
         "64K",
        "256K",
          "1M",
          "2M",
          "4M",
          "8M",
         "16M",
         "32M",
         "64M",
        "128M",
        "256M",
        "512M"]
plt.xlim(xtvals[0],xtvals[len(xtvals)-1])
plt.xticks(xtvals,xtlabels,rotation=45)

#print(mbdata.shape)
#print(mbdata)


cmap = 'tab20b'
markers = ['.','*','^','s','d','+','']
lengths=np.array(list(sorted(set(mbdata[:,0]))))
colors = {k:v for k,v in zip(lengths,plt.get_cmap(cmap)(np.linspace(0, 1, len(lengths))).tolist())}
labels = {k:"L=%s"%(sizeof_fmt(k)) for k in lengths }

markers = {k: markers[i%len(markers)] for i,k in enumerate(lengths)}
inds = {k: np.where(mbdata[:,0]==k)[0] for k in lengths}
#for i in range(9,27):
for L in lengths:
  #plt.plot(mbdata[istt:istt+i,1],mbdata[istt:istt+i,2],
  plt.plot(mbdata[inds[L],1],mbdata[inds[L],2],color=colors[L],label=labels[L],marker=markers[L])
  #istt=istt+i+1





plt.legend(bbox_to_anchor=(1.04,0.5),loc='center left')
plt.subplots_adjust(right=0.7,bottom=0.15)
plt.savefig("%s.pdf"%file)

