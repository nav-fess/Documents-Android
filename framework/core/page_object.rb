# frozen_string_literal: true

# Module for implementing PageObject testing design pattern
module PageObject
  def self.included(class_name)
    class_name.extend(Elements)
  end

  # Module for definition page elements
  module Elements
    def define_common_methods(name, type, selector)
      define_element name, type, selector
      define_elements name, type, selector
      define_click name, type, selector
      define_displays name, type, selector
      define_selector name, type, selector
      define_wait name, type, selector
    end

    def define_element(name, type, selector)
      define_singleton_method("#{name}_#{type}") do
        element selector
      end
    end

    def define_elements(name, type, selector)
      define_singleton_method("#{name}_#{type}s") do
        elements selector
      end
    end

    def define_click(name, type, selector)
      define_singleton_method("#{name}_#{type}_click") do
        click selector
      end
    end

    def define_displays(name, type, selector)
      define_singleton_method("#{name}_#{type}?") do
        !elements(selector).empty?
      end
    end

    def define_selector(name, type, selector)
      define_singleton_method("#{name}_#{type}_selector") do
        selector
      end
    end

    def define_wait(name, type, selector)
      define_singleton_method("#{name}_#{type}_wait") do
        puts "wait selector = #{selector}"
        wait_until selector
      end
    end

    def button(name, selector = { id: nil })
      type = 'button'

      define_common_methods name, type, selector
    end

    def textfield(name, selector = { id: nil })
      type = 'textfield'

      define_common_methods name, type, selector

      define_singleton_method("#{name}_#{type}_fill") do |data = ''|
        element(selector).send_keys data
      end
    end

    def text(name, selector = { id: nil })
      type = 'text'

      define_common_methods name, type, selector

      define_singleton_method("#{name}_#{type}_value") do
        element(selector).text
      end
    end

    def image(name, selector = { id: nil })
      type = 'image'

      define_common_methods name, type, selector
    end

    def view(name, selector = { id: nil })
      type = 'view'

      define_common_methods name, type, selector
    end

    def layout(name, selector = { id: nil })
      type = 'layout'

      define_common_methods name, type, selector
    end
  end
end
