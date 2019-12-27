# frozen_string_literal: true

# Class for fast access to operations in "+" FAB
class PlusFAB
  def self.open
    click id: ID::PLUS_FAB
  end

  def self.entity_name(name)
    fill_form id: ID::DIALOG_FIELD, data: name
  end

  def self.create(name, type, close = false)
    click id: type_to_id(type)
    entity_name name
    click id: ID::DIALOG_ACCEPT
    hardback if close && type != :folder
  end

  def self.displayed?
    elements(id: ID::PLUS_FAB).count.positive?
  end

  def self.type_to_id(type)
    return ID::CREATE_DOC if type == :document
    return ID::CREATE_TABLE if type == :spreadsheet
    return ID::CREATE_PRESENTATION if type == :presentation
    return ID::CREATE_FOLDER if type == :folder
  end
end
