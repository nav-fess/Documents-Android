# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage without frame
  class OtherBaseStorage
    def self.create(url, email, pass)
      click_on_storage
      fill_url url
      fill_email email
      fill_pass pass
      save
    end

    def self.click_on_storage; end

    def self.fill_url(url)
      fill_form id: ID::CLOUD_NAME, data: url
    end

    def self.fill_email(email)
      fill_form  id: ID::CLOUD_LOGIN, data: email
    end

    def self.fill_pass(pass)
      fill_form  id: ID::CLOUD_PASS, data: pass
    end

    def self.save
      click id: ID::CLOUD_SAVE, pause: 3
    end
  end
end
