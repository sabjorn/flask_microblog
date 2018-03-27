FROM python:3.6.4-slim-stretch

# bind python3 as python
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip

# install flask
RUN pip install flask

RUN mkdir -p /microblog
COPY app /microblog/app
COPY microblog.py /microblog/microblog.py

ENV FLASK_APP=microblog.py

WORKDIR /microblog
#ENTRYPOINT ['bash']
CMD ["flask", "run", "--host=0.0.0.0"]