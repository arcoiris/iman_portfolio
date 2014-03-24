# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
set :stage, :production
set :branch, "master"
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
server 'deblora.com', user: 'deployer', roles: %w{web app db}, primary:
true

set :deploy_to "/home#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name
set :rails_env, :production 

# number of unicorn workers, this will be reflected in the unicorn.rb
# and the monit configs
set :unicorn_worker_count, 5

# whether we're using ssl or not, used for building nginx 
# config file
set :enable_ssl, false

