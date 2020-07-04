# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'login again through context menu', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  after :all do
    Account.reset_counter
  end

  Account.cloud_type.each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize} : Logout" do
        Account.context_buttons[Account.counter].click
        ContextAccount.logout_button_click time: 3
        Account.item_account_buttons[Account.counter].click
      end

      it "#{type.capitalize} : Login again" do
        Account.login_again type, account
      end

      it "#{type.capitalize} : Check login" do
        account_tool_bar = CloudTopToolBar.account_sub_title_text_value.split('/')[0]
        BottomNavigationBar.profile_button_click
        Account.count_item
        expect(account[:name]).to include(account_tool_bar)
      end
    end
  end
end
