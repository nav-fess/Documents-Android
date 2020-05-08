# frozen_string_literal: true

# Module for storing constants
module Consts
  DOCUMENT_NAME = 'Document'
  SPREADSHEET_NAME = 'Spreadsheet'
  PRESENTATION_NAME = 'Presentation'
  FOLDER_NAME = 'Folder'
  PROJECT_NAME = 'Project'

  PREFIX_ADMIN = 'Admin'
  PREFIX_USER = 'User'

  PREFIX_CREATE = 'Created'

  DOCUMENT_EXTENSIONS = %w[docx doc odt rtf txt].freeze
  SPREADSHEET_EXTENSIONS = %w[xlsx xls ods csv].freeze
  PRESENTATION_EXTENSIONS = %w[pptx ppt odp].freeze

  module MyDocuments
    TITLE = 'MyDocuments'
  end

  module SharedWithMe
    TITLE = 'SharedWithMe'

    ADMIN_DOCUMENT_NAME = PREFIX_ADMIN + DOCUMENT_NAME
    ADMIN_SPREADSHEET_NAME = PREFIX_ADMIN + SPREADSHEET_NAME
    ADMIN_PRESENTATION_NAME = PREFIX_ADMIN + PRESENTATION_NAME
    ADMIN_FOLDER_NAME = PREFIX_ADMIN + FOLDER_NAME

    USER_DOCUMENT_NAME = PREFIX_USER + DOCUMENT_NAME
    USER_SPREADSHEET_NAME = PREFIX_USER + SPREADSHEET_NAME
    USER_PRESENTATION_NAME = PREFIX_USER + PRESENTATION_NAME
    USER_FOLDER_NAME = PREFIX_ADMIN + FOLDER_NAME
  end

  module CommonDocuments
    TITLE = 'CommonDocuments'
  end

  module ProjectDocuments
    TITLE = 'ProjectDocuments'

    ADMIN_PROJECT_NAME = PREFIX_ADMIN + PROJECT_NAME
    USER_PROJECT_NAME = PREFIX_USER + PROJECT_NAME
  end

  module Trash
    TITLE = 'Trash'
  end

  module Registration
    FIRST_NAME = 'NCT'
    LAST_NAME = 'TEST'
    INFO_PORTAL_KEY = 'getinfoportal00000'
    LOCALES = { eu: 'EU', com: 'US', sg: 'CN' }.freeze
    REGION_HINT = { com: '.onlyoffice.com', eu: '.onlyoffice.eu',
                    sg: '.onlyoffice.sg', info: '.teamlab.info' }.freeze
  end

  SECTIONS = [MyDocuments::TITLE, SharedWithMe::TITLE, CommonDocuments::TITLE,
              ProjectDocuments::TITLE, Trash::TITLE].freeze

  LOCALES = { BG: { locale: 'BG', language: 'bg' }, DE: { locale: 'DE', language: 'de' },
              ES: { locale: 'ES', language: 'es' }, FR: { locale: 'FR', language: 'fr' },
              IT: { locale: 'IT', language: 'it' }, PL: { locale: 'PL', language: 'pl' },
              BR: { locale: 'PT', language: 'BR' }, RU: { locale: 'RU', language: 'ru' },
              EN: { locale: 'EN', language: 'gb' }, US: { locale: 'US', language: 'en' },
              CN: { locale: 'CN', language: 'zh' } }.freeze
end
