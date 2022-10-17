FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN pip install -U pip setuptools
RUN pip install tqdm jupyterlab ipywidgets

WORKDIR /app

# COPY ./img/ /app/img/

RUN pip install -q pytorch-lightning==1.6.0
RUN pip install -q transformers timm pycocotools
RUN pip install onnx onnxruntime-gpu

EXPOSE 8888

ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password=''