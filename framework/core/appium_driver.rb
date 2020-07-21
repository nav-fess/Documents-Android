# frozen_string_literal: true

# Module for extending functional of Appium Driver
module AppiumDriver
  # Data for sending to fields if not specified any
  SENDING_DATA = 'default'
  # Seconds before action if not specified any
  DELAY_BEFORE_ACTION = 0
  # Seconds for matching element if not specified any
  TIME_TO_SEARCH = 20

  # Supported selector types:
  # :button, :text, :textfield, :id, :xpath
  # @param [Symbol] selector_type
  # @param [String, Integer] selector_value
  # @return [Element] matched element
  def find(selector_type, selector_value)
    case selector_type
    when :button then buttons[selector_value]
    when :text then texts[selector_value]
    when :textfield then textfields[selector_value]
    when :id then find_element id: selector_value
    when :xpath then find_element xpath: selector_value
    else raise ArgumentError, "Unknown selector type: #{selector_type}"
    end
  end

  # Usage example:
  # Search for an element with ID "abc"
  # with 5 seconds after calling the method for 60 second
  # element id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  # @return [Element] matched element
  def element(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    wait_true(time) do
      find selector_type, args[selector_type]
    end
  end

  # Usage example:
  # Search for an elements with ID "abc"
  # with 5 seconds after calling the method for 60 second
  # elements id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  # @return [Array] matched elements
  def elements(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    time.times do
      search_results = find_elements selector_type, args[selector_type]
      return search_results unless search_results.empty?

      sleep 1
    end
    []
  end

  # Usage example:
  # Click on the element with ID "abc"
  # with 5 seconds after calling the method for 60 second
  # click id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  def click(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    search_result = wait_true(time) do
      find selector_type, args[selector_type]
    end
    search_result.click
  end

  # Usage example:
  # Fill in the textfield with ID "abc"
  # with 5 seconds after calling the method for 60 second
  # and sent data "example@example.com"
  # fill_field id: 'someID', delay: 5, time: 60, data: "example@example.com"
  #
  # @param [Hash] args
  def fill_field(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    search_result = wait_true(time) do
      find selector_type, args[selector_type]
    end
    search_result.send_keys args[:data] || SENDING_DATA
  end

  # Usage example:
  # Emulating the action of pressing a physical hardback button
  # with 10 seconds after calling the method
  # hardback delay: 10
  #
  # @param [Hash] args
  def hardback(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    press_keycode 4
  end

  # Usage example:
  # Emulating the action of hiding a keyboard
  # with 5 seconds after calling the method
  # hide_keyboard delay: 5
  #
  # @param [Hash] args
  def hide_keyboard(args  = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    hide_keyboard if is_keyboard_shown
  end

  # Usage example:
  # Search for an element with ID "abc" inside another element
  # with 5 seconds after calling the method for 60 second
  # find_nested_element parent: element, id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  # @return [Element] matched element
  def find_nested_element(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    parent = args[:parent] || raise(ArgumentError, 'Unspecified parent!')
    selector_type = args.keys[1]
    wait_true(time) { selector_nested_type selector_type, parent, args }
  end

  # helper function for function find_nested_element
  def selector_nested_type(selector_type, parent, args)

    case selector_type
    when :id then parent.find_element id: args[:id]
    when :xpath then parent.find_element xpath: args[:xpath]
    else raise ArgumentError, "Unknown selector type: #{selector_type}"
    end
  end

  # Usage example:
  # Wait before an element with ID "abc" is not exist
  # with 5 seconds after calling the method for 60 second
  # wait_until id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  def wait_until(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    time.times do
      search_results = find_elements selector_type, args[selector_type]
      return true if search_results.count.positive?

      sleep 1
    end
    false
  end

  # Usage example:
  # Swipe the entire page from start to end for 3 seconds
  # swipe_down page_element, 1, 1, 3000
  #
  # @param [Element] target
  # @param [Integer] coeff_top
  # @param [Integer] coeff_bottom
  # @param [Integer] duration
  def swipe_down(target, coeff_top = 1, coeff_bottom = 1, duration = 5000)
    location = target.location
    size = target.size
    x = location.x + size.width / 2
    y = location.y + size.height
    Appium::TouchAction.new.swipe(start_x: x, start_y: y * coeff_bottom,
                                  offset_x: x, offset_y: y * coeff_top,
                                  duration: duration).perform
  end

  # Usage example:
  # Long press an element with ID "abc"
  # press id: 'someID', delay: 5, time: 60
  #
  # @param [Hash] args
  def press(args = {})
    sleep args[:delay] || DELAY_BEFORE_ACTION
    time = args[:time] || TIME_TO_SEARCH
    selector_type = args.keys.first
    element = find(selector_type, args[selector_type])
    wait_true(time) do
      Appium::TouchAction.new.long_press(element: element).perform
    end
  end
end
