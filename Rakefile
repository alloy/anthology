# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :db do
  task :seed do
    ENV['FIXTURES'] = 'cadres,roles'
    Rake::Task['db:fixtures:load'].invoke
  end
end
