# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'
require 'appium_lib'
include AppiumExtension

def capabilities_set(capabilities)
  capabilities.each do |key, value|
    caps[key] = value
  end
  restart
end

def registration_data
  Dir.chdir('../data/')
  JSON.parse(File.read("#{Dir.pwd}/PortalRegistrationData.json"))
end

def login_data_portals
  Dir.chdir('../data/')
  JSON.parse(File.read("#{Dir.pwd}/PortalLoginData.json"))
end

def login_data_personal
  Dir.chdir('../data/')
  JSON.parse(File.read("#{Dir.pwd}/PersonalLoginData.json"))
end

def login_data_clouds
  Dir.chdir('../data/')
  JSON.parse(File.read("#{Dir.pwd}/CloudLoginData.json"))
end

def add_data_storage
  Dir.chdir('../data/')
  JSON.parse(File.read("#{Dir.pwd}/StorageAddData.json"))
end
