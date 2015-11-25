FROM ruby:2.2 
MAINTAINER jay.p.h.johnson@gmail.com

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y \ 
  telnet \
  net-tools \
  vim \
  build-essential \ 
  nodejs

# Configure the main working directory. This is the base 
# directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
RUN mkdir -p /app && mkdir -p /opt && mkdir -p /opt/webapp && mkdir -p /opt/actionhooks
WORKDIR /opt/webapp

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
ADD Gemfile ./ 
ADD Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Move Deploy Keys into the .ssh directory
ADD github_ssh_config /root/.ssh/config

# cleanup files on disk and set the actionhooks directory
RUN chmod 700 /root/.ssh/config 
RUN cp /opt/webapp/actionhooks/* /opt/actionhooks/ && chmod 777 /opt/actionhooks

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD /opt/actionhooks/start.sh



