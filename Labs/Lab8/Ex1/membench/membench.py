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

mbdata = np.genfromtxt("membench.out",usecols=(1,3,5))

plt.ylabel("Time (nsec)")
plt.xlabel("Stride (bytes)")
plt.xscale("log",base=2)
plt.ylim(0,np.ceil(max(mbdata[:,2]))+1)
xtvals=np.concatenate([np.power(4,range(1,11)), np.power(2,range(21,29))])
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
        "256M"]
plt.xlim(xtvals[0],xtvals[len(xtvals)-1])
plt.xticks(xtvals,xtlabels,rotation=45)
istt=0
print(mbdata.shape)
print(mbdata)

lengths=np.array(list(set(mbdata[:,0])))
print(lengths)

#for i in range(9,27):
for L in lengths:
  inds = np.where(mbdata[:,0]==L)[0]
  print(inds)
  #plt.plot(mbdata[istt:istt+i,1],mbdata[istt:istt+i,2],
  plt.plot(mbdata[inds,1],mbdata[inds,2],
    label="L=%s"%(sizeof_fmt(L)))
  #istt=istt+i+1

plt.legend(bbox_to_anchor=(1.04,0.5),loc='center left')
plt.subplots_adjust(right=0.7,bottom=0.15)
plt.savefig("membench.png")

