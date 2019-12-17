# frozen_string_literal: true

require 'spec_helper'

auth_data_path = File.join __dir__, '..', '..', '..', 'data', 'roles.json'
auth_data = JSON.parse File.read(auth_data_path), symbolize_names: true
user_data = AuthDataTools.find_by_role(auth_data[:accounts], 'guest')[0]

describe 'Check the absence of a My Documents section', :roles, :guest do
  it 'open login form' do
    Login.before_login
  end

  it 'login' do
    Login.login_onlyoffice_enterprise url: auth_data[:url],
                                      email: user_data[:login],
                                      password: user_data[:pass]
  end

  it 'check section list' do
    OpenSection.sections_displayed? 10
    my_docs = elements xpath: Xpath::MY_DOCUMENTS_SECTION
    expect(my_docs.count.zero?).to be_truthy
  end
end

describe 'Check the absence of a plus FAB in sections', :roles, :guest do
  before :all do
    Login.before_login
  end

  it 'login' do
    Login.login_onlyoffice_enterprise url: auth_data[:url],
                                      email: user_data[:login],
                                      password: user_data[:pass]
  end

  it 'check in Shared with me' do
    OpenSection.shared_with_me if OpenSection.sections_displayed? 10
    plus_fab = elements id: ID::PLUS_FAB
    expect(plus_fab.count.zero?).to be_truthy
  end

  it 'check in Common Documents' do
    OpenSection.common_documents if OpenSection.sections_displayed? 10
    plus_fab = elements id: ID::PLUS_FAB
    expect(plus_fab.count.zero?).to be_truthy
  end

  it 'check in Projects Documents' do
    OpenSection.projects_documents if OpenSection.sections_displayed? 10
    plus_fab = elements id: ID::PLUS_FAB
    expect(plus_fab.count.zero?).to be_truthy
  end

  it 'check in Trash' do
    OpenSection.trash if OpenSection.sections_displayed? 10
    plus_fab = elements id: ID::PLUS_FAB
    expect(plus_fab.count.zero?).to be_truthy
  end
end
