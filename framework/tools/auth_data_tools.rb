# frozen_string_literal: true

# Class contains methods for getting private data
class AuthDataTools
  def self.find_by_role(target_list, role)
    result = []
    target_list.each do |account|
      result << account if account[:role] == role
    end
    result
  end

  def self.parse_json(file_name)
    JSON.parse(File.read(File.join(__dir__, '..', '..', 'data', file_name)))
  end
end
