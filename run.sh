#!/bin/bash

script_dir=$(dirname $BASH_SOURCE)
sif_file=aleph-builder.sif
sif_path=${script_dir}/${sif_file}

set -x
singularity exec $sif_path $@