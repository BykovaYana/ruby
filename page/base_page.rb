require_relative '../helper/driver'

class BasePage
  USER_ACCOUNT = {xpath: "//li[@class ='nav-item identifier']"}
  HOME = {xpath: "//div[@class ='logo']//a"}

  def initialize
    web_driver = Driver.new
    @@driver = web_driver.get_instance
  end

  def user_account_drop_down
    @@driver.find_element(USER_ACCOUNT)
  end

  def home
    @@driver.find_element(HOME)
  end

  def element_disabled?(element)
    attribute = element.attribute('class')
    return attribute.include? 'disabled'
  end
end
