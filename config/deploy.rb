# config valid only for Capistrano 3.1
lock '3.1.0'

set :application,'iman_portfolio'
set :repo_url, 'git@github.com:arcoiris/iman_portfolio.git'

set :deploy_to, '/home/deploy/iman_portfolio'

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end