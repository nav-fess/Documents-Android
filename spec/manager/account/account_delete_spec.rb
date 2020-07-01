# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe "Delete all accounts", :account do
  before(:all) { Onboarding.skip_button_click }

  before :each do
    CloudList.other_storage_button_click
    Account.add login_data
  end

  it "Delete account through select all" do
    Account.item_account_button_press delay: 3
    AccountBar.more_button_click  time: 5
    AccountBar.select_all_button_click  delay: 2, time: 5
    AccountBar.delete_account_button_click time: 5
    element_exist = CloudList.get_started_button
    expect(element_exist).to be_truthy
  end

  it "Delete  account through context menu" do
    Account.number_login.times do
      Account.context_button_click
      ContextAccount.remove_button_click
      Dialog.accept_button_click
    end
    element_exist = CloudList.get_started_button
    expect(element_exist).to be_truthy
  end

  after :each do
    Account.count_login_zero
  end
end

describe "Delete accounts personal and enterprise", :account do

  before :all do
    type_cloud = %i[personal enterprise]
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data, type_cloud
  end

  it  "Delete account from profile" do
    Account.number_login.times do
      Account.context_button_click
      ContextAccount.profile_button_click
      ContextAccount.remove_button_click
      Dialog.accept_button_click
    end
    element_exist = CloudList.get_started_button
    expect(element_exist).to be_truthy
  end

  after :all do
    Account.count_login_zero
  end
end


