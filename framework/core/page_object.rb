# frozen_string_literal: true

# Module for implementing PageObject testing design pattern
module PageObject
  def self.included(class_name)
    class_name.extend(Elements)
  end

  # Module for definition page elements
  module Elements
    # Seconds before action if not specified any
    DELAY_DEFAULT = AppiumDriver::DELAY_BEFORE_ACTION

    # Seconds for matching element if not specified any
    TIME_DEFAULT =  AppiumDriver::TIME_TO_SEARCH

    def define_common_methods(name, type, selector)
      define_element name, type, selector
      define_elements name, type, selector
      define_click name, type, selector
      define_displays name, type, selector
      define_selector name, type, selector
      define_wait name, type, selector
    end

    def define_element(name, type, selector)
      define_singleton_method("#{name}_#{type}") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
        element selector
      end
    end

    def define_elements(name, type, selector)
      define_singleton_method("#{name}_#{type}s") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] =  time
        elements selector
      end
    end

    def define_click(name, type, selector)
      define_singleton_method("#{name}_#{type}_click") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
        click selector
      end
    end

    def define_displays(name, type, selector)
      define_singleton_method("#{name}_#{type}?") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
        !elements(selector).empty?
      end
    end

    def define_selector(name, type, selector)
      define_singleton_method("#{name}_#{type}_selector") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
        selector
      end
    end

    def define_wait(name, type, selector)
      define_singleton_method("#{name}_#{type}_wait") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
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

      define_singleton_method("#{name}_#{type}_fill") do |data = '', delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
        element(selector).send_keys data
      end
    end

    def text(name, selector = { id: nil })
      type = 'text'

      define_common_methods name, type, selector

      define_singleton_method("#{name}_#{type}_value") do |delay: DELAY_DEFAULT, time: TIME_DEFAULT|
        selector[:delay] = delay
        selector[:time] = time
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
