# SDSC "raxml" roll

## Overview

This roll bundles a collection of genetic sequencing packages raxml,garli and mafft

For more information about the various packages included in the raxml roll
please visit their official web pages:

- <a href="http://sco.h-its.org/exelixis/software.html" target="_blank">RAXML</a> (Randomized Axelerated Maximum Likelihood) is a program for sequential and parallel
Maximum Likelihood based inference of large phylogenetic trees. 
- <a href="https://code.google.com/p/garli/" target="_blank">GARLI</a> is a program that performs phylogenetic inference using the maximum-likelihood criterion.  
- <a href="http://mafft.cbrc.jp/alignment/software" target="_blank">MAFFT</a> is a multiple sequence alignment program 


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate raxml source file(s) using a machine that does have
Internet access and copy them into the `src/<package>` directories on your Rocks
development machine.


## Dependencies

intel compiler and mpi rolls

## Building

To build the raxml-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `raxml-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


```shell
Typing:

make 

will build raxml,garli and mafft  with the intel compiler and the openmpi MPI implementation
```


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll raxml
% cd /export/rocks/install
% rocks create distro
% rocks run roll raxml | bash
```

The module files are:
```shell
/opt/modulefiles/applications/raxml
/opt/modulefiles/applications/garli
/opt/modulefiles/applications/mafft
```


## Testing

The raxml-roll includes a test script which can be run to verify proper
installation of the raxml-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/raxml.t 
