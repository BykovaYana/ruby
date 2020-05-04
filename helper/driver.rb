require 'rubygems'
require 'selenium-webdriver'

class Driver
  @@driver = nil

  def get_instance
    options = Selenium::WebDriver::Chrome::Options.new
    if @@driver.nil?
       @@driver = Selenium::WebDriver.for(:chrome, options: options)
       @@driver.manage.timeouts.implicit_wait = 15
       return @@driver
    else
      return @@driver
    end
  end
end

