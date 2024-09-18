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
./aleph-builder.sif
Singularity> cd aleph/apps/bees
Singularity> make R=1
```

compiling lines module

```sh
./aleph-builder.sif
Singularity> cd aleph/modules/lines
Singularity> make
```
