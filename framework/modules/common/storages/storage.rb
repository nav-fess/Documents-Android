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
    when :googledrive then Google.add_account     storage
    when :dropbox     then Dropbox.add_account    storage
    when :onedrive    then OneDrive.add_account   storage
    when :yandexdisk  then YandexDisk.add_account storage
    when :boxcloud    then Box.add_account        storage
    when :owncloud    then OwnCloud.add_account   storage
    when :nextcloud   then NextCloud.add_account  storage
    when :webdav      then WebDAV.add_account     storage
    else puts 'Onother cloud'
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
