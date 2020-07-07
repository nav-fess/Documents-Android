# frozen_string_literal: true

require_relative 'dropbox'
require_relative 'google'
require_relative 'onedrive'
require 'appium_lib'

# class for storage
class Storage < BasePageObject
  def self.choice_storage(storage)
    symbol_storage = name_to_symbol storage[:name]

    case symbol_storage
    when :googledrive then Google.add_storage     storage
    when :dropbox     then Dropbox.add_storage    storage
    when :onedrive    then OneDrive.add_storage   storage
    when :yandexdisk  then YandexDisk.add_storage storage
    when :boxcloud    then Box.add_storage        storage
    when :owncloud    then OwnCloud.add_storage   storage
    when :nextcloud   then NextCloud.add_storage  storage
    when :webdav      then WebDAV.add_storage     storage
    else raise TypeError, 'Other cloud!'
    end
    BottomNavigationBar.clouds_button_click delay: 4 if BottomNavigationBar.clouds_button_wait
  end

  def self.name_to_symbol(storage)
    storages = %i[googledrive dropbox onedrive yandexdisk boxcloud owncloud nextcloud webdav]
    storages.each { |cloud| return cloud if storage.downcase.include? cloud.to_s }
  end

  def self.storage?(storage_name)
    xpath = "//android.widget.TextView[@text='#{storage_name}']"
    exist_storage = elements(xpath: xpath).empty? ? false : true
    2.times { back }
    exist_storage
  end
end
