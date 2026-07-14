# aleph-builder

a singularity container definition for the avr32 and blackfin toolchains and
supporting commands required to build firmware for the monome aleph.

unlike docker, singularity provides access to the underlying host filesystem,
devices, etc. and runs tools as the current user which greatly simplifies the
workflow.

_NOTE: this container assumes a x86_64 linux host_

## building

```sh
make
```

this builds `aleph-builder.sif` in the local directory from `aleph-builder.def`.

## installation

```sh
make install
```

installs the image as `aleph-builder` in `~/.local/bin` (ensure that directory
is on your `$PATH`).

## usage

clone aleph firmware

```sh
git clone --recursive https://github.com/monome/aleph.git
```

compiling bees application

```sh
# singularity images can be run directly to get a shell, similar to a venv
cd aleph/apps/bees
aleph-builder make R=1
```

compiling lines module

```sh
cd aleph/modules/lines
aleph-builder make
```

any command within the container can be run in the current working directory by
passing it as an argument:

```sh
aleph-builder avr32-gcc --version
avr32-gcc (AVR_32_bit_GNU_Toolchain_3.4.2_435) 4.4.7
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

export toolchain headers for IDE include paths

```sh
aleph-builder export-avr-headers ./avr-headers
aleph-builder export-bfin-headers ./bfin-headers
```
