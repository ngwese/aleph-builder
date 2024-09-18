# aleph-builder

a singularity containner definition for the avr32 and blackfin toolchains and
supporting commands required to build firmware for the monome aleph.

_NOTE: this container assumes a x86_64 linux host_

## building

`sudo singularity build --force aleph-builder.sif aleph-builder.def`

## usage

compiling bees application

```sh
./aleph-builder.sif
Singularity> cd <aleph-src-root>/apps/bees
Singularity> make R=1
```

compiling lines module

```sh
./aleph-builder.sif
Singularity> cd <aleph-src-root>/modules/lines
Singularity> make
```
