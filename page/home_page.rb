require_relative '../helper/driver'
require_relative 'base_page'

class HomePage < BasePage

  def main_menu_element(name)
    @@driver.find_element(:xpath, "//a[contains(., '#{name}')]")
  end

end
