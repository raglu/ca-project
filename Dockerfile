FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN apt-get install -y git

RUN git clone https://github.com/raglu/ca-project.git

WORKDIR ca-project/

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "run.py"]
