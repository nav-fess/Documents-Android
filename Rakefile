# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'
require_relative 'spec/spec_helper'

def format_opts(device, tag_list, date, separator = '_')
  device_format = device.split(' ').join(separator).downcase
  date_format = date.strftime "%d-%m-%y#{separator}%H-%M-%S"
  tag_format = ''
  tag_list.each { |tag| tag_format += "-t #{tag} " }
  report_path = "reports/#{device_format}#{separator}#{date_format}.html"
  "#{tag_format} -f html -o #{report_path}"
end

namespace :run do
  desc 'Run tests on all connected physical devices and emulators'
  task :parallel do
    adb = ADB.new
    adb.devices.each do |udid|
      `gnome-terminal -- rake run:single udid=#{udid}`
    end
  end

  desc 'Run tests on specified connected device or emulator, need udid arg for working'
  task :single do
    config_name = 'test_devices_config'
    RSpec::Core::RakeTask.new(:spec) do |t|
      ConfigReader.load
      config = ConfigReader.find_config_by_udid config_name, ENV['udid']
      t.rspec_opts = format_opts config[:name], config[:tag_list], Time.now
    end

    begin
      Rake::Task['spec'].execute
    ensure
      puts 'Press any key for exit...'
      STDIN.gets
    end
  end
end
