require 'json'
require_relative '../spec/spec_helper.rb'

def data_portals
  JSON.parse(File.read("#{Dir.pwd}/PortalTypeData.json"))
end

def data_registration_portal(key)
  dataportals = data_portals[key].to_s.split('|')
  { 'portal' => dataportals[0], 'email' => dataportals[1], 'first_name' => dataportals[2],'last_name'=> dataportals[3], 'p'=> dataportals[4], 'local' => dataportals[5], "language" => dataportals[6]}
end

def search_data_registration_portal(domen_name, attribute)
  data = data_registration_portal(domen_name)
  data[attribute]
end


describe 'Registration in portal' do
  puts "Describe: #{metadata[:description]}"

  let(:dataPortals){ data_portals }

  data_portals.each_key do |key|
    context 'User registration a portal' do |data_portals|
      puts "Context:  #{metadata[:description]}"

      it 'localization portal' do |ds|
        print "\n* #{ds.description} =>  "
        local = search_data_registration_portal(key,"local" )
        language = search_data_registration_portal(key,"language" )
        caps['locale'] = local
        caps['language'] = local
        restart
        (expect(caps['locale']).to eq(local)) && (expect(caps['language']).to eq(language))
      end

      it 'click on Skip_button' do |ds|
        print "\n* #{ds.description} =>  "
        cl = find_element(id: "on_boarding_panel_skip_button").click
        expect(cl).to be_truthy
      end

    end
  end

end