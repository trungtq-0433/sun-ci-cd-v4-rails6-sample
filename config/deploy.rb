require_relative "deploy/utils"

# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

# common config
set :application, "sun-ci-cd-v4-rails6-sample"
set :repo_url, "git@github.com:trungtq-0433/sun-ci-cd-v4-rails6-sample.git"

# https://capistranorb.com/documentation/faq/why-does-something-work-in-my-ssh-session-but-not-in-capistrano/
# https://capistranorb.com/documentation/advanced-features/ptys/
# By default Capistrano prefers to start a non-login, non-interactive shell,
# to try and isolate the environment and make sure that things work as expected,
# regardless of any changes that might happen on the server side.
# set :pty, true

set :rails_env, ENV["RAILS_ENV"]
set :deploy_to, "/usr/local/rails_apps/#{fetch :application}"
set :keep_releases, 5
set :migration_role, :web_app # https://github.com/capistrano/rails#recommendations
set :assets_roles, :web_app # Defaults to [:web]
set :puma_role, :web_app # Defaults to [:app]

if ENV["DEPLOY_REF"] # Can input branch or tag. Using DEPLOY_REF=tag cap staging deploy
  set :branch, ENV["DEPLOY_REF"]
else
  raise "Please set $DEPLOY_REF !!!"
end

# rbenv config => https://github.com/capistrano/rbenv
set :rbenv_type, :user
set :rbenv_ruby, File.read(".ruby-version").strip

# config share file. i don't know cannot using append
# no need `linked_files`, becuz using ENV
# set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle .bundle public/system public/uploads]
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads"

# default shell environment used during command execution
# logic compatible gem dotenv => https://github.com/bkeepers/dotenv
set :default_env, load_env_from_file

# OPTIONAL config PUMA cluster
set :puma_threads, [0, 5]
set :puma_workers, 2
set :puma_preload_app, true
set :puma_init_active_record, true

namespace :deploy do # becuz command it `cap <ENV> deploy`
  desc "=======create database======="
  task :create_database do
    on roles(:web_app) do |host|
      within "#{release_path}" do
        with rails_env: ENV["RAILS_ENV"] do
          execute :rake, "db:create"
        end
      end
    end
  end
  before :migrate, :create_database

  desc "=======link dotenv=======" # using gem dotenv
  task :link_dotenv do
    on roles(:web_app) do
      upload! "/home/deploy/.env", "/home/deploy/.env" if ENV["UPDATE_ENV"]
      execute "ln -s /home/deploy/.env #{release_path}/.env"
    end
  end
  after "bundler:install", "deploy:link_dotenv"
end
