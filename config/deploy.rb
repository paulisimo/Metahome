#require "bundler/capistrano"
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2' # Defaults to 'default'
#set :rvm_ruby_string, 'rails3'        # Or whatever env you want it to run in.

set :application, "metahome"
set :user, "app"
set :use_sudo, false

#ssh_options[:keys] = ["#{ENV['HOME']}/app/.ssh/"] #Obviously needed
ssh_options[:forward_agent] = true  #Ah hah.. Success!s

#default_run_options[:pty] = true #cos it's debian?

set :repository,  "git@github.com:paulisimo/Metahome.git"
set :deploy_to, "/home/app/www/#{application}"
set :scm, :git
set :git_enable_submodules, 1         # Make sure git submodules are populated

set :port, 8888                      # The port you've setup in the SSH setup section
set :location, "80.229.217.200"
#set :location, "192.168.1.6"
role :app, location
role :web, location
role :db,  location, :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
