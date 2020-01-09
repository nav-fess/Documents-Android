# frozen_string_literal: true

desc 'delete and create folder for screenshots'
task :create_folder_for_screenshots do
  FileUtils.rm_rf 'Screenshots2'
  FileUtils.mkdir_p 'Screenshots/Errors'
end

desc 'create folder for application'
task :create_folder_for_apk do
  FileUtils.mkdir 'apk2'
end

desc 'create folder data for configuration tests files'
task :create_folder_for_JSON_files do
  FileUtils.mkdir 'data'
end

desc 'create file with data options appiums framework'
task :create_appium_options_files do
  FileUtils.mkdir 'config'
  FileUtils.cd 'config'
  appium_txt = "[caps]
appActivity = \"com.onlyoffice.documents.ui.activities.login.SplashActivity\"
appPackage = \"com.onlyoffice.documents\"
autoGrantPermissions = true
automationName = \"UiAutomator2\"
deviceName = \"Device\"
newCommandTimeout = \"3600\"
platformName = \"Android\""

  FileUtils.touch 'appium.txt'
  File.open('appium.txt', 'w') { |file| file.write appium_txt }
end

desc 'for first run tests after git clone'
task :first_run do |_t, args|
  Rake::Task[:create_appium_options_files].invoke(args)
  Rake::Task[:create_folder_for_JSON_files].invoke(args)
  Rake::Task[:create_folder_for_apk].invoke(args)
  Rake::Task[:create_folder_for_screenshots].invoke(args)
end
