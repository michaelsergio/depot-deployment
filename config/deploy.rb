set :application, "depot"
set :user, 'sergio'
set :domain, 'depot.yourhost.com'

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_string, '1.9.3'
set :rvm_type, :user

set :repository, "git@github.com:michaelsergio/depot-deployment.git"
set :deploy_to, "/home/#{user}/code/fakeserver/"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain
role :app, domain
role :db,  domain, :primaty => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
#
## miscellaneous options
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production
namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
run "cd #{release_path} && bundle install"
end

