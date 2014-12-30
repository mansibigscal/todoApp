
# Ensure that bundle is used for rake tasks
# SSHKit.config.command_map[:rake] = "bundle exec rake" 
# SSHKit.config.command_map[:rails] = "bundle exec rails"

# config valid only for Capistrano 3.1
# lock '3.2.1'

#load 'deploy/assets'
#load 'deploy'

set :application, 'todoApp'
set :repo_url, 'git@github.com:mansibigscal/todoApp.git'
#set :repository, 'git@github.com:mansibigscal/todoApp.git'

set :user, "ubuntu"

set :stage, ["production"]

#set :domain, "54.69.30.251"

# adjust if you are using RVM, remove if you are not
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require "rvm/capistrano"
#set :rvm_ruby_string, '2.0.0'
#set :rvm_type, :user

#repository is on the deployment server
#set :repository,  "ssh://ubuntu@54.69.30.251/home/ubuntu/CapistranoApps/cap_git/todoApp.git/"
set :deploy_to, "/var/www/todoApp"

set :keep_releases, 5

# role :app, "54.69.30.251"
# role :web, "54.69.30.251"
# role :db, "54.69.30.251", :primary => true

set :deploy_via, :remote_cache
set :scm, 'git'
#set :branch, 'master'
# set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
#set :ssh_options, { :forward_agent => true}

set :ssh_options, {
    # keys: %w(/Users/ved/BigscalUbuntu.pem),
    keys: %w(/Users/ved/BigscalRORUbuntu.pem),
    forward_agent: true, 
    auth_methods: %w(publickey)   
}

# server '54.69.30.251', user: 'ubuntu', roles: %w{web app db}, primary: true
# server '54.148.131.143', user: 'ubuntu', roles: %w{web app db}, primary: true


#set :scm_verbose, true
#set :use_sudo, false
#set :rails_env, :production

namespace :deploy do
 
	desc 'Restart application'
		task :restart do
			on roles(:app), in: :sequence, wait: 5 do
			# Restarts Phusion Passenger
			execute :touch, release_path.join('tmp/restart.txt')
		end
	end
	 
	after :publishing, :restart
	 
	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
		# Here we can do anything such as:
		# within release_path do
		# execute :rake, 'cache:clear'
		# end
		end
	end
 
end 

# namespace :deploy do
#   desc "cause Passenger to initiate a restart"
#   task :restart do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# end



# desc "install the necessary prerequisites"
# task :bundle_install, :roles => :app do
#   run "cd #{release_path} && bundle install"
# end

# after "deploy:update_code", :bundle_install


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
#set :branch, "master"

# Default deploy_to directory is /var/www/my_app
#set :deploy_to, '/var/www/#{application}'

#load File.expand_path('../secrets_deploy.rb', __FILE__)

#set :default_env, { database_url:  "mysql2://deploy:#{fetch(:dbpassword)}@localhost/#{fetch(:application)}_#{fetch(:stage)}" }

#set :linked_files, %w{config/database.yml config/secrets.yml}

#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for :scm is :git
# set :scm, :git

# set :rails_env, "production"

# set :deploy_via, :remote_cache

# set :ssh_options, {:forward_agent => true}

#set :pty, true

# set :log_level, :debug 

set :use_sudo, true

#default_run_options[:pty] = true

task :hello do
  puts "Hello World"
end

# task :symlink_config, :roles => :app do 
#   run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
# end


# server "54.69.30.251", roles: [:app, :web, :db], :primary => true

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# namespace :deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end

# namespace :deploy do
#     task :start do ; end
#     task :stop do ; end
#     task :restart, :roles => :app, :except => { :no_release => true } do
#           run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#     end
# end

# namespace :deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#        execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#     after :restart, :clear_cache do
#       on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       # execute :rake, 'cache:clear'
#       # end
#       end
#     end 

# end

