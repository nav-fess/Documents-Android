# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'login again through context menu', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  login_counter = 0
  Account::CLOUD_TYPE.each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize} : Logout" do
        Account.context_buttons[login_counter].click
        ContextAccount.logout_button_click time: 3
        Account.item_account_buttons[login_counter].click
        login_counter += 1
      end

      it "#{type.capitalize} : Login again" do
        Account.login_again type, account
      end

      it "#{type.capitalize} : Check login" do
        account_tool_bar = CloudTopToolBar.account_sub_title_text_value.split('/')[0]
        BottomNavigationBar.profile_button_click
        expect(account[:name]).to include(account_tool_bar)
      end
    end
  end
end
