require 'json'

module DataPotalHelpers
  def data_portals
    JSON.parse(File.read("#{Dir.pwd}/PortalTypeData.json"))
  end

  def data_registration_portal(key)
    dataportals = data_portals[key].to_s.split('|')
      { portal: dataportals[0], email: dataportals[1], first_name: dataportals[2],last_name: dataportals[3], p: dataportals[4], locale: dataportals[5], language: dataportals[6]}
   end

  def search_data_registration_portal(domen_name, attribute)
    data = data_registration_portal(domen_name)
    data[attribute]
  end
end