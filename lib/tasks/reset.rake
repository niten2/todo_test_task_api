task :reset => :environment do

  require 'rake'

  TestTaskApi::Application.load_tasks

  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed_fu'].invoke

end
