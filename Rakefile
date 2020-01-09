# frozen_string_literal: true

desc 'prepare folder for screenshots'
task :update_folder_for_screenshots do
  FileUtils.rm_rf 'screenshots'
  FileUtils.mkdir_p 'screenshots/errors'
end

desc 'create folder for application'
task :create_folder_for_apk do
  FileUtils.mkdir 'apk'
end

desc 'create folder for data tests'
task :create_folder_for_JSON_files do
  FileUtils.mkdir 'data'
end

desc 'for first run tests after git clone'
task :first_run do |_t, args|
  Rake::Task[:create_folder_for_JSON_files].invoke(args)
  Rake::Task[:create_folder_for_apk].invoke(args)
  Rake::Task[:create_folder_for_screenshots].invoke(args)
end
