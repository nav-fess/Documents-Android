# frozen_string_literal: true

# Class for navigation between portal sections
class OpenSection
  def self.my_documents
    click xpath: Xpath::MY_DOCUMENTS_SECTION
  end

  def self.shared_with_me
    click xpath: Xpath::SHARED_WITH_ME_SECTION
  end

  def self.common_documents
    click xpath: Xpath::COMMON_SECTION
  end

  def self.projects_documents
    click xpath: Xpath::PROJECTS_SECTION
  end

  def self.trash
    click xpath: Xpath::TRASH_SECTION
  end

  def self.sections_displayed?(time)
    time.times do
      return true if find_elements(id: ID::ACCOUNTS).count.positive?

      sleep 1
    end
    false
  end
end
