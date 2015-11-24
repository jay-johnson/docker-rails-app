## Rails app with internal container hooks for Docker and Travis 

This repository is an example for showing how to setup a local development environemnt with docker hosting a rails application running inside a container image

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

### How to run

```
docker-rails-app$ docker run -it -d --publish 0.0.0.0:3000:3000 --name=demo-rails demo-rails
ed72180c1c65fd4a2bd9be8f26437a5b19f04c1d7dba5715fde9661412092641
docker-rails-app$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ed72180c1c65        demo-rails         "/bin/sh -c /opt/acti"   6 seconds ago       Up 4 seconds        0.0.0.0:3000->3000/tcp   demo-rails
docker-rails-app$ 
```

### How to stop

```
docker-rails-app$ docker stop demo-rails
demo-rails
docker-rails-app$
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

### View the App

Open a browser for:

http://localhost:3000/welcome/index

### Running the Hello World Rake Test:

```
bundle exec rake test TEST=test/controllers/hello_world_test.rb
```

