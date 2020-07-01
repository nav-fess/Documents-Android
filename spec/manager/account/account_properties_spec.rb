# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe "Accounts properties math", :account do

  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  it  "Properties math through context menu" do
    count_match = 0
    Account.cloud_type.each do |type|
      login_data[type].each do |account|
        Account.context_buttons[count_match].click
        portal = ContextAccount.portal_name_text_value delay:2
        portal = portal.split( '/')[0]
        login =  ContextAccount.email_text_value
        count_match += 1 if (account[:name].include? portal) && (account[:login].include? login)
        back
      end
    end
    expect(count_match).to eq(Account.number_login)
  end

  after :all do
    Account.count_login_zero
  end
end