# frozen_string_literal: true

# Class for fast access to operations in "+" FAB
class PlusFAB
  def self.create_file(name:, id:)
    click id: id
    entity_name name
    create
  end

  def self.create_folder(name:)
    click id: ID::CREATE_FOLDER
    entity_name name
    create
  end

  def self.open
    click id: ID::PLUS_FAB
  end

  def self.entity_name(name)
    fill_form id: ID::EDIT_NAME_FIELD, data: name
  end

  def self.create
    click id: ID::CREATE_FAB
  end

  def self.displayed?
    elements(id: ID::PLUS_FAB).count.positive?
  end
end
