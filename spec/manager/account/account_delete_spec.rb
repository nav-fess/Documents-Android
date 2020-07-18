# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe "Delete all #{Account.name}s", :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  it 'All accounts : Delete through select all' do
    Account.item_account_button_press delay: 3
    AccountBar.more_button_click time: 5
    AccountBar.select_all_button_click delay: 2, time: 5
    AccountBar.delete_account_button_click time: 5
  end

  it 'All accounts : Check delete' do
    element_exist = CloudList.get_started_button
    expect(element_exist).to be_truthy
  end
end

describe "Delete #{Account.name}s through context menu", :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  Account::CLOUD_TYPE.each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize} : Delete" do
        Account.context_button_click
        ContextAccount.remove_button_click
        Dialog.accept_button_click
      end

      it "#{type.capitalize} : Check delete" do
        portal = ContextAccount.portal_name_text? ? ContextAccount.portal_name_text_value : ' '
        login  = ContextAccount.email_text?       ? ContextAccount.email_text_value       : ' '
        data_math = (account[:name].include? portal) &&
                    (account[:login].include? login)
        expect(data_math).to be_falsey
      end
    end
  end
end

describe "Delete #{Account.name}s personal and enterprise from profile", :account do
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
        portal = ContextAccount.portal_name_text? ? ContextAccount.portal_name_text_value : ' '
        login  = ContextAccount.email_text?       ? ContextAccount.email_text_value       : ' '
        data_math = (account[:name].include?  portal) &&
                    (account[:login].include? login)
        expect(data_math).to be_falsey
      end
    end
  end
end
