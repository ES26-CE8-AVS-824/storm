srun singularity exec --nv --writable-tmpfs \
     -B /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/storm_venv:/scratch/storm_venv \
     -B $HOME/.singularity:/scratch/singularity \
     /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/pytorch_22.02.sif \
     /bin/bash -c "export TMPDIR=/scratch/singularity/tmp && \
                   pip list"