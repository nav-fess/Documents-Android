require 'json'

# module for help work with data-files
module DataPortalHelpers
  def data_portals
    JSON.parse(File.read("#{Dir.pwd}/PortalTypeData.json"))
  end

  def data_registration_portal(tl_domen)
    all_data_potal = data_portals[tl_domen].to_s.split('|').concat locale_language(tl_domen)
    keys_hash_data_portals.zip(all_data_potal).to_h
  end

  def search_data_registration_portal(domen_name, attribute)
    data = data_registration_portal(domen_name)
    data[attribute]
  end

  def locale_language(tl_domen)
    case tl_domen
    when 'eu', 'info'
      %w[RU RU]
    when 'com'
      %w[EN EN]
    when 'sg'
      %w[VIE VI]
    else
      'Languages and localization are not supported'
    end
  end

  def keys_hash_data_portals
    %w[portal email first_name last_name p locale language]
  end
end
