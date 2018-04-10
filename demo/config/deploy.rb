set :stages, %w(staging qa webservices sandbox qa2 qa3 staging_cache staging_labs staging_hidden_api staging_fg staging_admin demo enterpriseqa)
#set :default_stage, 'qa'
require 'capistrano/ext/multistage'

#        require './config/boot'

#require 'hoptoad_notifier/capistrano'
require './config/boot'

default_run_options[:pty] = true

# try to fix build, failing due to airbrake
#require 'airbrake/capistrano'
