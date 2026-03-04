#srun singularity exec --nv --writable-tmpfs \
#    /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/pytorch_22.02.sif \
#    pip install --user virtualenv

#srun singularity exec --nv \
#    /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/pytorch_22.02.sif \
#    bash -c "python -m virtualenv --system-site-packages \
#             /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/storm_venv"

srun singularity exec --nv --writable-tmpfs \
     -B /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/storm_venv:/scratch/storm_venv \
     -B $HOME/.singularity:/scratch/singularity \
     /ceph/project/es26-ce8-avs-824/whispers-in-the-storm/extern/storm/pytorch_22.02.sif \
     /bin/bash -c "export TMPDIR=/scratch/singularity/tmp && \
                   source /scratch/storm_venv/bin/activate && \
                   pip install -r requirements.txt --no-cache-dir --no-build-isolation"
