require 'rubygems'
require 'selenium-webdriver'

class Driver
  @@driver = nil

  def get_instance
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('start-maximized')
    options.add_argument('disable-popup-blocking')
    options.add_argument('incognito')
    options.add_argument('disable-dev-shm-usage')
    options.headless!
    if @@driver.nil?
       @@driver = Selenium::WebDriver.for(:chrome, options: options)
       @@driver.manage.timeouts.implicit_wait = 15
       return @@driver
    else
      return @@driver
    end
  end
end

