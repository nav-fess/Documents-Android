# frozen_string_literal: true

require 'spec_helper'

describe 'Help and Feedbac', :settings_NP30PRO do
  before :all do
    Onboarding.skip_button_click
  end

  it 'Help : Tap button help' do
    BottomNavigationBar.profile_button_click delay: 3
    Account.settings_button_click delay: 3
    Settings.help_button_click
    sleep 2
  end

  it 'Help : Check text link' do
    About.browser_buttons[1].click
    sleep 5
    help_url = Settings.help_url_texts[0].text
    expect(help_url).to include Consts::Settings::HELP_URL
    back
  end

  it 'Feedbac : Fill textfield' do
    Settings.feedback_button_click
    Settings.edit_feedback_textfield_fill 'NCT auto mobile test. SKIP PLEASE'
    Dialog.accept_button_click
  end

  it 'Feedbac : Check a mail client' do
    sleep 2
    choose_email = Settings.tab_emails_text_value delay: 5
    expect(choose_email).to include Consts::Settings::CHOOSE_EMAIL
  end
end
