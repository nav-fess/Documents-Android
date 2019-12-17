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
end
