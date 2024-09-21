# aleph-builder

a singularity container definition for the avr32 and blackfin toolchains and
supporting commands required to build firmware for the monome aleph.

unlike docker, singularity provides access to the underlying host filesystem,
devices, etc. and runs tools as the current user which greatly simplifies the
workflow.

_NOTE: this container assumes a x86_64 linux host_

## building

```sh
sudo singularity build --force aleph-builder.sif aleph-builder.def
```

## usage

clone aleph firmware

```sh
git clone --recursive https://github.com/monome/aleph.git
```

compiling bees application

```sh
# singularity images can be run directly to get a shell, similar to a venv
./aleph-builder.sif

# the initial path will be the same a $PWD, na
Singularity> cd aleph/apps/bees
Singularity> make R=1
```

compiling lines module

```sh
./aleph-builder.sif
Singularity> cd aleph/modules/lines
Singularity> make
```

alternatively the `run.sh` script can be used to execute any command from
within the container in the current working directory.

```sh
# run directly on the compilation host
cd aleph/apps/bees
../../../run.sh make R=1
```

the `run.sh` script expects to find the `aleph-builder.sif` file in the same
directory. the script can be modified to suite in order to integrate it into
one's editor of choice. any command can be run, for instance:

```sh
./run.sh avr32-gcc --version
+ singularity exec ./aleph-builder.sif avr32-gcc --version
avr32-gcc (AVR_32_bit_GNU_Toolchain_3.4.2_435) 4.4.7
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
