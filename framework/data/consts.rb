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
    LOCALES = { eu: 'EN', com: 'US', sg: 'CN' }.freeze
    REGION_HINT = { com: '.onlyoffice.com', eu: '.onlyoffice.eu',
                    sg: '.onlyoffice.sg', info: '.teamlab.info' }.freeze
  end

  module About
    TERMS_OF_USE = 'help.onlyoffice.com/products/files/doceditor.aspx?fileid=' \
                 '5048471&doc=bXJ6UmJacDVnVDMxV01oMHhrUlpwaGFBcXJUUUE3VHRuTGZrRUF5a1NKVT0_IjUwNDg0NzEi0'
    PRIVACY_POLICY = 'help.onlyoffice.com/products/files/doceditor.aspx?fileid=5048502&doc=SXhWMEVzSEYxNl'\
                  'VVaXJJeUVtS0kyYk14YWdXTEFUQmRWL250NllHNUFGbz0_IjUwNDg1MDIi0&_ga=2.88767003.1895363220'\
                  '.1524051386-398072085.1517577558'
    LICENSE = 'www.apache.org/licenses/LICENSE-2.0'
    WEBSITE = 'www.onlyoffice.com/'
  end

  module Settings
    CLEAR_SIZE_CACHE = '0.00 Bytes'
    PATH_TO_FILE = 'sdcard/OnlyOffice/'
    NAME_FILE = 'big_size.pptx'
    HELP_URL = 'https://helpcenter.onlyoffice.com/mobile-applications/documents/android/'
    CHOOSE_EMAIL = 'Choose email client...'
  end

  module Alert
    DONT_UPLOAD = 'You can upload only when Wi-Fi is enabled'
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
