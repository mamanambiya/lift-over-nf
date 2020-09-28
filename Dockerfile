FROM nfcore/base

COPY env/environment.yml /env/

RUN conda env create --file /env/environment.yml && conda clean -a
ENV PATH=/opt/conda/envs/liftover/bin:$PATH
