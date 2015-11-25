## Local Rails Development running in Docker and integrated with Travis 

[![Travis](https://travis-ci.org/jay-johnson/docker-rails-app.svg)](https://travis-ci.org/jay-johnson/docker-rails-app.svg)

This repository is an example for showing how to setup a local development environment with docker hosting a rails application running inside a container image. It also uses Travis CI (https://travis-ci.org/jay-johnson/docker-rails-app) for Docker container building and then running the tests against the rails application from inside the container.

### Install

Make sure your environment has these components:

```
$ rails -v
Rails 4.2.4
$ ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
$ 
```

### How to build

```
docker build -t demo-rails .
```

### How to use the existing image

The latest Docker image is also stored publicly on Docker Hub: https://hub.docker.com/r/jayjohnson/rails-app/

Pull the latest with:

```
docker pull jayjohnson/rails-app
```

### How to run

```
docker-rails-app$ docker run -it -d --publish 0.0.0.0:3000:3000 --name=demo-rails demo-rails
ed72180c1c65fd4a2bd9be8f26437a5b19f04c1d7dba5715fde9661412092641
docker-rails-app$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ed72180c1c65        demo-rails         "/bin/sh -c /opt/acti"   6 seconds ago       Up 4 seconds        0.0.0.0:3000->3000/tcp   demo-rails
docker-rails-app$ 
```

### How to ssh into the container

```
docker exec -t -i demo-rails /bin/bash
```

### How to stop

```
docker-rails-app$ docker stop demo-rails
demo-rails
docker-rails-app$
```

### How to stop, remove, build, and start

```
$ docker stop demo-rails; docker rm demo-rails; docker build -t demo-rails .; docker run -it -d --publish 0.0.0.0:3000:3000 --name=demo-rails demo-rails
```

### Confirm the application is hosting the welcome page

```
docker-rails-app$ curl http://localhost:3000/welcome/index | grep Hello
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1429  100  1429    0     0  21544      0 --:--:-- --:--:-- --:--:-- 21651
<p>Hello World!</p>
docker-rails-app$ 
```

### Pulling the latest from inside a running container

```
root@b4f1ab122d82:/opt/webapp# git pull
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/jay-johnson/docker-rails-app
   63aba06..ca307ad  master     -> origin/master
First, rewinding head to replay your work on top of it...
Fast-forwarded master to ca307ada38bdae1a07a96d808166dac7381da630.
root@b4f1ab122d82:/opt/webapp# 
```

### View the App

Open a browser for:

```
http://localhost:3000/welcome/index
```

### Running the Hello World Rake Test:

```
bundle exec rake test TEST=test/controllers/hello_world_test.rb
```

