# frozen_string_literal: true

# Module for extends functional of Appium lib
module AppiumExtension
  def element(args = {})
    sleep args[:pause] || 0
    time = args[:time] || 5
    wait_true(time) do
      find args
    end
  end

  def elements(args = {})
    sleep args[:pause] || 0
    time = args[:time] || 5
    wait_true(time) do
      key = args[0].keys
      find_elements key, args[key]
    end
  end

  def fill_form(args = {})
    sleep args[:pause] || 0
    time = args[:time] || 5
    selenium_element = wait_true(time) do
      find args
    end
    selenium_element.send_keys args[:data]
  end

  def click(args = {})
    sleep args[:pause] || 0
    time = args[:time] || 5
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

  def hardback
    press_keycode 4
  end
end
