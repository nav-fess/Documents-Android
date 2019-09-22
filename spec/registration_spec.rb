require 'yaml'
require_relative '../spec/spec_helper.rb'

def data_portals
  YAML.load_file("#{Dir.pwd}/PortalTypeData.json")
end

def data_regestration_portal(key)
  dataportrals = data_portals[key].to_s.split('|')
  { 'portal' => dataportrals[0], 'email' => dataportrals[1], 'first_name' => dataportrals[2],'last_name'=> dataportrals[3], 'p'=> dataportrals[4], 'local' => dataportrals[5], "language" => dataportrals[6]}
end

def search_data_regestration_portal(domen_name, attribute)
  data = data_regestration_portal(domen_name)
  data[attribute]
end


describe 'Registration in portal' do
  print "\n Describe:  #{metadata[:description]}"

  let(:dataPortals){ data_portals }

  data_portals.each_key do |key|
    context 'User registration a portal' do |data_portals|
      print "\n Context:  #{metadata[:description]}"

      it 'localization portal' do |ds|
        print "\n* #{ds.description} =>  "
        local = search_data_regestration_portal(key,"local" )
        language = search_data_regestration_portal(key,"language" )
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