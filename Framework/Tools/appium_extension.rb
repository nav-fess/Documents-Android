# Module for extends functional of Appium lib

module AppiumExtension
  def element(args = {})
    key = selector_key(args)
    time = args[:time] || 5
    wait_true(time) do
      find_element key, args[key]
    end
  end

  def elements(args = {})
    key = selector_key(args)
    time = args[:time] || 5
    wait_true(time) do
      find_elements key, args[key]
    end
  end

  def fill_form(args = {})
    key = selector_key(args)
    time = args[:time] || 5
    selenium_element = wait_true(time) do
      find_element key, args[key]
    end
    selenium_element.send_keys args[:data]
  end

  def click(args = {})
    key = selector_key(args)
    time = args[:time] || 5
    selenium_element = wait_true(time) do
      find_element key, args[key]
    end
    selenium_element.click
  end

  def selector_key(args_hash)
    return :id until args_hash[:id].nil?
    return :xpath until args_hash[:xpath].nil?
  end

  def hardback
    press_keycode 4
  end
end