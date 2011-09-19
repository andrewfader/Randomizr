set :application, "Randomizr"
set :repository,  "https://andrevan@github.com/andrevan/Randomizr.git"
set :deploy_to, "/home/afader/webapps/randomizr"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "web173.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web173.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web173.webfaction.com", :primary => true # This is where Rails migrations will run


set :user, "afader"
set :scm_username, "vcs_afader"
set :use_sudo, false
default_run_options[:pty] = true

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end