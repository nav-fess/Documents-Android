require_relative '../spec/spec_helper.rb'
require_relative '../helpers/data_portals_helpers.rb'
include DataPotalHelpers

describe 'Registration in portal' do
  puts "Describe: #{metadata[:description]}"

  data_portals.each_key do |tl_domen|
  context 'User registration a portal' do
    puts "Context:  #{metadata[:description]}"

    it 'localization portal' do |it_info|
      print "\n* #{it_info.description} =>  "
      locale = search_data_registration_portal(tl_domen,"locale" )
      language = search_data_registration_portal(tl_domen,"language" )
      caps['locale'] = locale
      caps['language'] = language
      restart
      (expect(caps['locale']).to eq(locale)) && (expect(caps['language']).to eq(language))
    end

    it 'click on Skip_button' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id: "on_boarding_panel_skip_button").click
      expect(click_on_element).to be_truthy
    end
  end
  end
end
