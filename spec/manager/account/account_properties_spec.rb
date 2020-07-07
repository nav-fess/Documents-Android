# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('account_data')

describe 'Accounts properties math through context menu', :account do
  before :all do
    Onboarding.skip_button_click
    CloudList.other_storage_button_click
    Account.add login_data
  end

  account_counter = 0
  Account::CLOUD_TYPE.each do |type|
    login_data[type].each do |account|
      it "#{type.capitalize} : Open properties" do
        Account.context_buttons[account_counter].click
        account_counter += 1
      end

      it "#{type.capitalize} : Check properties math " do
        portal = ContextAccount.portal_name_text_value delay: 2
        portal = portal.split('/')[0]
        login =  ContextAccount.email_text_value
        back
        data_math = (account[:name].include?  portal) &&
                    (account[:login].include? login)
        expect(data_math).to be_truthy
      end
    end
  end
end
