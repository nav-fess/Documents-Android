# frozen_string_literal: true

require 'spec_helper'

auth_data_path = File.join __dir__, '..', '..', '..', 'data', 'Roles.json'
auth_data = JSON.parse File.read(auth_data_path), symbolize_names: true
user_data = AuthDataTools.find_by_role(auth_data[:accounts], 'admin')[0]

context_ids = { document: ID::FILE_CONTEXT, spreadsheet: ID::FILE_CONTEXT,
                presentation: ID::FILE_CONTEXT, folder: ID::FOLDER_CONTEXT }

layout_ids = { document: ID::FILE_NAME, spreadsheet: ID::FILE_NAME,
               presentation: ID::FILE_NAME, folder: ID::FOLDER_NAME }

sections = { MyDocuments: Xpath::MY_DOCUMENTS_SECTION, CommonDocuments: Xpath::COMMON_SECTION }

names = { document: Consts::PREFIX_CREATE + Consts::DOCUMENT_NAME,
          spreadsheet: Consts::PREFIX_CREATE + Consts::SPREADSHEET_NAME,
          presentation: Consts::PREFIX_CREATE + Consts::PRESENTATION_NAME,
          folder: Consts::PREFIX_CREATE + Consts::FOLDER_NAME }

RSpec.configure do |config|
  config.before :all do
    Login.before_login
    Login.login_onlyoffice_enterprise url: auth_data[:url],
                                      email: user_data[:login],
                                      password: user_data[:pass]
  end
end

describe 'Create files and folder in each section' do
  sections.each_pair do |section, selector|
    describe section do
      it "open #{section}" do
        OpenSection.sections_displayed? 10
        click xpath: selector
      end

      names.each_pair do |type, name|
        describe type do
          it "create #{type}" do
            PlusFAB.open if PlusFAB.displayed?
            PlusFAB.create name, type, true
          end

          it "find #{type}" do
            click id: ID::SEARCH
            fill_form id: ID::SEARCH_FORM, data: name
            file = element id: layout_ids[type]
            expect(file.text.include?(name)).to be_truthy
          end

          it "delete #{type}" do
            click id: context_ids[type]
            click id: ID::FILE_DELETE
            click id: ID::DIALOG_ACCEPT
          end

          it 'close search' do
            2.times { hardback pause: 2}
          end
        end
      end
    end
  end
end
