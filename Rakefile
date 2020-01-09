# frozen_string_literal: true

SCREEN_FOLDER = 'screenshots'
ERRORS_FOLDER = 'errors'
APK_FOLDER = 'apk'
DATA_FOLDER = 'data'

desc 'prepare folder for screenshots'
task :update_folder_for_screenshots do
  FileUtils.rm_rf SCREEN_FOLDER
  FileUtils.mkdir_p File.join SCREEN_FOLDER, ERRORS_FOLDER
end

desc 'create folder for application'
task :create_folder_for_apk do
  FileUtils.mkdir APK_FOLDER
end

desc 'create folder for data tests'
task :create_folder_for_JSON_files do
  FileUtils.mkdir DATA_FOLDER
end

desc 'for first run tests after clone repository'
task :first_run do
  Rake::Task[:create_folder_for_JSON_files].execute
  Rake::Task[:create_folder_for_apk].execute
  Rake::Task[:update_folder_for_screenshots].execute
end
