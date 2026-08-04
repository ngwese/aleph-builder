# aleph-builder

[![publish container](https://github.com/ngwese/aleph-builder/actions/workflows/publish-container.yml/badge.svg)](https://github.com/ngwese/aleph-builder/actions/workflows/publish-container.yml)

a singularity container definition for the avr32 and blackfin toolchains and
supporting commands required to build firmware for the monome aleph.

unlike docker, singularity provides access to the underlying host filesystem,
devices, etc. and runs tools as the current user which greatly simplifies the
workflow.

*NOTE: this container assumes a x86_64 linux host*

## installation

ensure `~/.local/bin` is on your `$PATH`, then either pull a published image or
install one you built locally.

pull the published image from ghcr (recommended):

```sh
singularity pull --force ~/.local/bin/aleph-builder \
  oras://ghcr.io/ngwese/aleph-builder:latest
```

or, install the locally built image:

```sh
make && make install
```

both place an executable `aleph-builder` in `~/.local/bin`.

it is possible to run the image directly via `singularity run` without
installation which can be useful in some situations like ci:

```sh
singularity run oras://ghcr.io/ngwese/aleph-builder:latest {make, avr32-gcc, export-avr-headers, etc.}
```



## building

```sh
make
```

this builds `aleph-builder.sif` in the local directory from `aleph-builder.def`. 

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

