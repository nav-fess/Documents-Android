require 'yaml'
require_relative '../spec/config.rb'

def data_portals
  YAML.load_file("#{Dir.pwd}/PortalTypeData.json")
end

def data_regestration_portal(key)
  dataportrals = data_portals[key].to_s.split('|')
  { 'portal' => dataportrals[0], 'email' => dataportrals[1], 'first_name' => dataportrals[2],'last_name'=> dataportrals[3], 'p'=> dataportrals[4], 'local' => dataportrals[5] }
end

def search_data_regestration_portal(domen_name, attribute)
  data = data_regestration_portal(domen_name)
  data[attribute]
end


describe 'Registration in portal' do

  let(:dataPortals){ data_portals }

  data_portals.each_key do |key|
    context 'User registration a portal' do |data_portals|

      it 'localization portal' do
        local = search_data_regestration_portal(key,"local" )
        caps['locale'] = local
        caps['language'] = local
        pr = restart
        puts "pr = #{!!pr}"
      end

      it 'click on Skip_button' do
        cl = find_element(id: "on_boarding_panel_skip_button").click
        puts "cl = #{cl}"
      end

    end
  end

end