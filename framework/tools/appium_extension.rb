
# frozen_string_literal: true

# Module for extends functional of Appium lib
module AppiumExtension
  DEFAULT_PAUSE = 0
  DEFAULT_TIME = 5

  def element(args = {})
    sleep args[:pause] || DEFAULT_PAUSE
    time = args[:time] || DEFAULT_TIME
    wait_true(time) do
      find args
    end
  end

  def elements(args = {})
    sleep args[:pause] || DEFAULT_PAUSE
    time = args[:time] || DEFAULT_TIME
    wait_true(time) do
      key = args.keys[0]
      find_elements key, args[key]
    end
  end

  def fill_form(args = {})
    sleep args[:pause] || DEFAULT_PAUSE
    time = args[:time] || DEFAULT_TIME
    selenium_element = wait_true(time) do
      find args
    end
    selenium_element.send_keys args[:data]
  end

  def click(args = {})
    sleep args[:pause] || DEFAULT_PAUSE
    time = args[:time] || DEFAULT_TIME
    selenium_element = wait_true(time) do
      find args
    end
    selenium_element.click
  end

  def find(args_hash)
    variation_id = args_hash.keys[0]
    value_constant = args_hash[variation_id]
    return buttons[value_constant]         if variation_id.eql? :button
    return texts[value_constant]           if variation_id.eql? :text
    return textfields[value_constant]      if variation_id.eql? :textfield
    return find_element id: value_constant if variation_id.eql? :id

    find_element xpath: value_constant
  end

  def hardback(args = {})
    sleep args[:pause] || DEFAULT_PAUSE
    press_keycode 4
  end
end
