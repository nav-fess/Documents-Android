# frozen_string_literal: true

# Class for creating and managing a test instance
class TestInstance
  attr_accessor :udid, :server, :capabilities

  SERVER_RUN_DELAY = 3
  DRIVER_RUN_DELAY = 3

  # @param [String] udid
  # @return [TestInstance]
  def initialize(udid)
    @udid = udid
  end

  # @param [Hash] capabilities
  # @param [Integer] appium_port
  # @param [Integer] system_port
  def init(capabilities, appium_port, system_port)
    @server = AppiumServer.new @udid, appium_port, system_port

    @capabilities = capabilities
    Appium::Driver.new({ caps: @capabilities,
                         appium_lib: { port: appium_port } }, true)
    Appium.promote_appium_methods [Object]
  end

  def run
    @server.run
    # Waiting for server to start
    sleep SERVER_RUN_DELAY

    @driver.start_driver
    # Waiting for multithreading run
    sleep DRIVER_RUN_DELAY
  end

  def stop
    @driver.driver_quit
  end
end
