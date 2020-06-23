# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'Logout all accounts through context menu', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  after :all do
    Account.reset_counter
  end

  Account.cloud_type.each do |type|
    login_data[type].size.times do
      it "#{type.capitalize} : Logout" do
        Account.context_buttons[Account.counter].click
        ContextAccount.logout_button_click time: 5
      end

      it "#{type.capitalize} : Check logout" do
        Account.context_buttons[Account.counter].click
        element_exist = ContextAccount.login_button
        back
        Account.count_item
        expect(element_exist).to be_truthy
      end
    end
  end
end

describe 'Logout accounts personal and enterprise', :account_1 do
  before :all do
    type_cloud = %i[personal enterprise]
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data, type_cloud
  end

  after :all do
    Account.reset_counter
  end

  %i[personal enterprise].each do |type|
    login_data[type].size.times do
      it "#{type.capitalize} : Logout" do
        Account.context_buttons[Account.counter].click
        ContextAccount.profile_button_click
        ContextAccount.logout_button_click
        Dialog.accept_button_click
      end

      it "#{type.capitalize} : Check logout" do
        Account.context_buttons[Account.counter].click
        element_exist = ContextAccount.login_button
        Account.count_item
        back
        expect(element_exist).to be_truthy
      end
    end
  end
end
