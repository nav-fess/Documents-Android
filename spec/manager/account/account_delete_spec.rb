# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'Delete all accounts', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  it 'All accounts: Delete  through select all' do
    Account.item_account_button_press delay: 3
    AccountBar.more_button_click time: 5
    AccountBar.select_all_button_click delay: 2, time: 5
    AccountBar.delete_account_button_click time: 5
  end

  it 'All accounts: Check delete' do
    element_exist = CloudList.get_started_button
    expect(element_exist).to be_truthy
  end
end

describe 'Delete accounts through context menu', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  Account.cloud_type.each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize}: Delete" do
        Account.context_button_click
        ContextAccount.remove_button_click
        Dialog.accept_button_click
      end

      it "#{type.capitalize}: Check delete" do
        portal = Account.portal_name_text? ? Account.portal_name_text_value : ' '
        login  = Account.email_text?       ? Account.email_text_value       : ' '
        data_math = (account[:name].include? portal) &&
                    (account[:login].include? login)
        expect(data_math).to be_falsey
      end
    end
  end
end

describe 'Delete accounts personal and enterprise from profile', :account do
  before :all do
    type_cloud = %i[personal enterprise]
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data, type_cloud
  end

  %i[personal enterprise].each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize} : Delete" do
        Account.context_button_click
        ContextAccount.profile_button_click
        ContextAccount.remove_button_click
        Dialog.accept_button_click
      end

      it "#{type.capitalize} : Check delete" do
        portal = Account.portal_name_text? ? Account.portal_name_text_value : ' '
        login  = Account.email_text?       ? Account.email_text_value       : ' '
        data_math = (account[:name].include?  portal) &&
                    (account[:login].include? login)
        expect(data_math).to be_falsey
      end
    end
  end
end
