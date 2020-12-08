FROM python:3.8-buster

RUN mkdir /app
COPY version_server.py /app/
WORKDIR /app

RUN pip install --no-cache-dir flask
#RUN apt-get update -y
#RUN apt-get install python3 python3-pip -y
#RUN python3 -m pip install flask

CMD [ "python", "/app/version_server.py" ]