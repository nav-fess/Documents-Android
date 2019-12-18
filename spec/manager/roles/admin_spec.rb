# frozen_string_literal: true

require 'spec_helper'

auth_data_path = File.join __dir__, '..', '..', '..', 'data', 'roles.json'
auth_data = JSON.parse File.read(auth_data_path), symbolize_names: true
user_data = AuthDataTools.find_by_role(auth_data[:accounts], 'admin')[0]
file_types = { document: ID::CREATE_DOC, spreadsheet: ID::CREATE_TABLE,
               presentation: ID::CREATE_PRESENTATION }

describe 'Create files in My Documents section', :roles, :admin do
  it 'open login form' do
    Login.before_login
  end

  it 'login' do
    Login.login_onlyoffice_enterprise url: auth_data[:url],
                                      email: user_data[:login],
                                      password: user_data[:pass]
  end

  it 'open My Documents section' do
    OpenSection.my_documents if OpenSection.sections_displayed? 10
  end

  file_types.each_pair do |type, id|
    describe "create #{type}" do
      creation_time = Time.now.strftime '%Y-%m-%d %H-%M-%S'

      it 'generate creation time' do
        creation_time = Time.now.strftime '%Y-%m-%d %H-%M-%S'
      end

      it "create #{type}" do
        PlusFAB.open if PlusFAB.displayed?
        PlusFAB.create_file name: creation_time, id: id
      end

      it 'close editor' do
        hardback
      end

      it "find #{type}" do
        click id: ID::SEARCH
        fill_form id: ID::SEARCH_FORM, data: creation_time
        file = element id: ID::FILE_NAME
        expect(file.text.include?(creation_time)).to be_truthy
      end

      it 'close search' do
        2.times { hardback }
      end
    end
  end
end

describe 'Create folder in My Documents section', :roles, :admin do
  creation_time = Time.now.strftime '%Y-%m-%d %H-%M-%S'

  it 'open login form' do
    Login.before_login
  end

  it 'login' do
    Login.login_onlyoffice_enterprise url: auth_data[:url],
                                      email: user_data[:login],
                                      password: user_data[:pass]
  end

  it 'open My Documents section' do
    OpenSection.my_documents if OpenSection.sections_displayed? 10
  end

  it 'create folder' do
    PlusFAB.open if PlusFAB.displayed?
    PlusFAB.create_folder name: creation_time
  end

  it 'find folder' do
    click id: ID::SEARCH
    fill_form id: ID::SEARCH_FORM, data: creation_time
    file = element id: ID::FOLDER_NAME
    expect(file.text.include?(creation_time)).to be_truthy
  end

  it 'close search' do
    2.times { hardback }
  end
end
