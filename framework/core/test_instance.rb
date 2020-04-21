# frozen_string_literal: true

# Class for creating and managing a test instance
class TestInstance
  attr_accessor :udid, :server, :capabilities

  SERVER_RUN_DELAY = 3
  DRIVER_RUN_DELAY = 3

  # @param [String] udid
  # @return [TestInstance]
  def initialize(udid, capabilities, appium_port, system_port)
    @udid = udid
    @capabilities = capabilities
    @appium_port = appium_port
    @system_port = system_port
  end

  # @param [Hash] capabilities
  # @param [Integer] appium_port
  # @param [Integer] system_port
  def init(udid = @udid, capabilities = @capabilities, appium_port = @appium_port, system_port = @system_port)
    init_server udid, appium_port, system_port
    init_driver capabilities, appium_port
  end

  def init_driver(capabilities = @capabilities, appium_port = @appium_port)
    Appium::Driver.new({ caps: capabilities,
                         appium_lib: { port: appium_port } }, true)
    Appium.promote_appium_methods [Object]
  end

  def init_server(udid = @udid, appium_port = @appium_port, system_port = @system_port)
    @server = AppiumServer.new udid, appium_port, system_port
  end

  def run_driver
    @driver.start_driver
    # Waiting for multithreading run
    sleep DRIVER_RUN_DELAY
  end

  def restart_driver
    stop_driver
    init_driver
    run_driver
  end

  def run_server
    @server.run
    # Waiting for server to start
    sleep SERVER_RUN_DELAY
  end

  def run
    run_server
    run_driver
  end

  def stop_driver
    @driver&.driver_quit
    @driver = nil
  end
end
