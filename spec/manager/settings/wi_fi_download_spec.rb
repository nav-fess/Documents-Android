# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'Switch wi-fi download', :sim do
  before :all do
    toggle_wifi
    execute_script('mobile: shell', command: 'svc data enable')
    Onboarding.skip_button_click delay: 5
  end

  after :all do
    toggle_wifi
    execute_script('mobile: shell', command: 'svc data disable')
  end

  it 'Wi-Fi: Tap on te switch' do
    BottomNavigationBar.profile_button_click delay: 3
    Account.setting_button_click delay: 3
    Settings.switch_button_click delay: 2
    back
  end

  it 'Wi-Fi: Login to enterprise portal' do
    CloudList.other_storage_button_click
    cloud_enterprise = login_data[:enterprise].first
    Account.login_enterprise cloud_enterprise
    sleep 2
    back
  end

  it 'Wi-Fi: Download file on portal' do
    BottomNavigationBar.on_device_button_click
    CommonFileList.file_context_buttons[1].click
    ContextMenu.download_button_click
  end

  it 'Wi-Fi: Check snackbar' do
    search_results = Alert.snackbar_text_value delay: 2
    expect(search_results).to eq Alert::DONT_UPLOAD
  end
end
