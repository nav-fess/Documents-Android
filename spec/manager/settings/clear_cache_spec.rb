# frozen_string_literal: true

require 'spec_helper'

describe 'Clear cache', :settings do
  before :all do
    push_file("#{Consts::Settings::PATH_TO_FILE}#{Consts::Settings::NAME_FILE}",
              File.read("./data/files/#{Consts::Settings::NAME_FILE}"))
    Onboarding.skip_button_click
  end

  after :all do
    BottomNavigationBar.on_device_button_click
    Search.perform Consts::Settings::NAME_FILE
    CommonFileList.file_context_button_click
    ContextMenu.remove_button_click
  end

  it 'Clear cache : Search file' do
    BottomNavigationBar.on_device_button_click
    Search.perform Consts::Settings::NAME_FILE
  end

  it 'Clear cache : open and close file' do
    CommonFileList.file_layout_click
    sleep 6
    back
  end

  it 'Clear cache :Tap button ' do
    BottomNavigationBar.profile_button_click
    Account.settings_button_click delay: 3
    Settings.clear_cache_layout_click
    Dialog.accept_button_click
  end

  it 'Clear cache : Check size cache' do
    size_cache =  Settings.size_cache_text_value
    expect(size_cache).to eq Consts::Settings::CLEAR_SIZE_CACHE
    back
  end
end
