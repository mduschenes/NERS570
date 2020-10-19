#!/bin/bash

# Paths
cwd=$(pwd)
build_dir=$(pwd)


# Builds
build_download=0
build_load=1
build_configure=0
build_make=1
build_install=1
buid_test=0

# Download PETSc
echo Downloading PETSc ...
url=https://gitlab.com/petsc/petsc.git
folder=petsc
flags=("-b release")

if [[ ${build_download} -eq 1 ]]
then
	if [[ ! -d ${folder} ]]
	then
		git clone ${flags[@]} ${url} ${folder}
	fi
fi
cd ${folder}
git pull


# Load Modules
echo Loading modules ...
collection=petsc-build
cc=gcc
modules=(${cc} openmpi openblas lapack python3.6-anaconda)
module purge

 
if [[ ${build_load} -eq 1 ]]
then
	if [[ -z $(module savelist 2>&1 | grep ${collection}) ]]
	then
		module disable ${collection}
		for m in ${modules[@]}
		do
			echo $m
			module load ${m}
		done

		module save ${collection}
	else
		module restore ${collection}
	fi
fi
module list


# Install PETSc
config=configure
log=config.log

flags=("--with-debugging=0" "--prefix=${build_dir}" "--with-openblas=1" "--with-openblas-dir=${OPENBLAS_ROOT}" "-COPTFLAGS=-g -O3" "-CXXOPTFLAGS=-g -O3" "-FOPTFLAGS=-g -O3")
#mkdir -p build


if [[ ${build_configure} -eq 1 ]]
then
	./${config} "${flags[@]}" 2>&1 | tee ${log}
fi

	
# Make PETSc
makelog=make.log

pattern="Configure stage complete. Now build PETSc libraries with:" 
makecmd=$(grep "${pattern}" -A1 ${log} | sed "s%${pattern}\(.*\)%\1%")
if [[ ${build_make} -eq 1 ]]
then
	$makecmd 2>&1 | tee ${makelog}
fi

pattern="Now to install the libraries do:"
makecmd=$(grep "${pattern}" -A1 ${makelog} | sed "s%${pattern}\(.*\)%\1%")

if [[ ${build_install} -eq 1 ]]
then
	$makecmd 2>&1 | tee ${makelog}
fi

# Cleanup
cd ${cwd}
