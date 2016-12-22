`ssh-add`
# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "pet_project"
set :repo_url, "git@github.com:Swingcloud/Haustier.git"
set :deploy_to, '/home/deploy/pet_project'
set :keep_releases, 5

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/google_map.yml', 'config/initializers/geocoder.rb'
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :passenger_restart_with_touch, true
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
