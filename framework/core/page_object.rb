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
        selector_type = selector.keys.first
        element selector_type => selector[selector_type]
      end
    end

    def define_elements(name, type, selector)
      define_singleton_method("#{name}_#{type}s") do
        selector_type = selector.keys.first
        elements selector_type => selector[selector_type]
      end
    end

    def define_click(name, type, selector)
      define_singleton_method("#{name}_#{type}_click") do
        selector_type = selector.keys.first
        click selector_type => selector[selector_type]
      end
    end

    def define_displays(name, type, selector)
      define_singleton_method("#{name}_#{type}?") do
        selector_type = selector.keys.first
        !elements(selector_type => selector[selector_type]).empty?
      end
    end

    def define_selector(name, type, selector)
      define_singleton_method("#{name}_#{type}_selector") do
        selector[selector.keys.first]
      end
    end

    def define_wait(name, type, selector)
      define_singleton_method("#{name}_#{type}_wait") do
        selector_type = selector.keys.first
        wait_until selector_type => selector[selector_type]
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
        selector_type = selector.keys.first
        element(selector_type => selector[selector_type]).send_keys data
      end
    end

    def text(name, selector = { id: nil })
      type = 'text'

      define_common_methods name, type, selector

      define_singleton_method("#{name}_#{type}_value") do
        selector_type = selector.keys.first
        element(selector_type => selector[selector_type]).text
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
