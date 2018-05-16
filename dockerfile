FROM python:3.6.4-slim-stretch

# bind python3 as python
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip

# install flask
COPY requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir -p /microblog
COPY app /microblog/app
COPY microblog.py /microblog/microblog.py
COPY config.py /microblog/config.py
COPY app.db /microblog/app.db 

ENV FLASK_APP=microblog.py

WORKDIR /microblog
#ENTRYPOINT ['bash']
CMD ["flask", "run", "--host=0.0.0.0"]