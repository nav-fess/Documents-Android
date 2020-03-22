# frozen_string_literal: true

# Class for creating Appium Server
class AppiumServer
  attr_reader :appium_port, :port, :udid

  # @param [String] udid
  # @param [Integer] appium_port
  # @param [Integer] system_port
  # @return [AppiumServerWrapper] instance
  def initialize(udid, appium_port, system_port)
    @udid = udid
    @appium_port = appium_port
    @port = system_port
  end

  # @return [NilClass]
  def run
    system "x-terminal-emulator -e appium -p #{@appium_port} -dc "\
            "\"{\\\"udid\\\":\\\"#{@udid}\\\",\\\"systemPort\\\":#{@port}}\""
    sleep 3
    ENV["APPIUM_SERVER_STATE_#{@udid}"] = '1'
  end
end
