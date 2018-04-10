#require 'bundler/capistrano'
#require 'capistrano/bundler'
#set :application, fetch(:application, 'staging.healthtap.com')
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :application, 'foo' 
set :scm, :git
set :repository, 'git@github.com:yeshwant-singh/tetsing_capistrano.git'
set :branch, fetch(:b, 'master') 
set :user, "yeshwant"
#set :deploy_via, :copy
role :web, '127.0.0.1'
role :db,  '127.0.0.1'
server "127.0.0.1", :app, :web, :db, :primary => true, password: 'yukti'
set :deploy_to,  "/Users/yeshwant/#{application}"

after 'deploy:update_code' do
  deploy.abort_if_migration_needed_on_labs
end

namespace :deploy do
	task :abort_if_migration_needed_on_labs do 
		run "cd #{release_path}/demo"
		run "pwd"
		a = `bundle exec bundle exec rake db:abort_if_pending_migrations`
		puts a
		#run "bundle exec rake db:abort_if_pending_migrations"
	end
end

