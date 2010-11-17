require "bundler/capistrano"

set :application, "metahome"
set :user, "app"
set :use_sudo, true

ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_rsa"] #Obviously needed
ssh_options[:forward_agent] = true  #Ah hah.. Success!s

set :repository,  "git@github.com:paulisimo/Metahome.git"
set :deploy_to, "/home/app/www/#{application}"
set :scm, :git
set :git_enable_submodules, 1         # Make sure git submodules are populated

set :port, 8888                      # The port you've setup in the SSH setup section
set :location, "80.229.217.200"
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
