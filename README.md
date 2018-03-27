# Flask Microblog Docker Project
## About
A dockerized version of the [Flask Mega Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world).

## Usage
### Docker
#### Building
To build the docker image, run (in this git repo directory):
```
docker build -t flask_microblog .
```
This will build a docker image called `flask_microblog`.

**Note**: Building only has to happen when the files in the repo change.

#### Running
After **building** the docker image, it can be run with the command:
```
docker run --rm -p 5000:5000 --name microblog flask_microblog 
```
This will start the docker image, callig it `microblog`.

`--rm` makes sure the container is removed after exited

`-p 5000:5000` forwards the local port `5000` into the container as `5000`

### Docker-Compose
Docker-Compose makes *building* and *running* the image much easier.
#### Building
In the main directory, run:
```
docker-compose build
```
**Note**: Building only has to happen when the files in the repo change.

#### Running
After building the image, run:
```
docker-compose up
```

**Note**: `-d` added to the end will make the docker container run in the background.

### Extra Notes
The run command in the tutorial is:
```
flask run
``` 
but in the context of a docker, the comman is changed to:
```
flask run host="0.0.0.0"
```
This allows computers (such as the host running the docker container) to access the microblog.