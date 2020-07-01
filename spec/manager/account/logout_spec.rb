require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe "logout all accounts", :account do
  before :each do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  it "Logout account through context menu" do
    Account.number_login.times do
      Account.context_buttons[Account.number_logout].click
      ContextAccount.logout_button_click  time: 5
      Account.context_buttons[Account.number_logout].click
      Account.count_logout if ContextAccount.login_button
      back
    end
    expect(Account.number_logout).to eq(Account.number_login)
  end

  after :each do
    Account.count_login_zero
    Account.count_logout_zero
  end
end

describe "Logout accounts personal and enterprise", :account do

  before :each do
    type_cloud = %i[personal enterprise]
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data, type_cloud
  end

  it "Logout  account through profile" do
    Account.number_login.times do
      Account.context_buttons[Account.number_logout].click
      ContextAccount.profile_button_click
      ContextAccount.logout_button_click
      Dialog.accept_button_click
      Account.context_buttons[Account.number_logout].click
      Account.count_logout if ContextAccount.login_button
      back
    end
    expect(Account.number_logout).to eq(Account.number_login)
  end

  after :each do
    Account.count_login_zero
    Account.count_logout_zero
  end
end
