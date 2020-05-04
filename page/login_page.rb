require_relative '../helper/driver'
require_relative 'base_page'

class LoginPage < BasePage
  USER_NAME_MRS = {id: "username"}
  PASSWORD_MRS = {id: "password"}
  LOGIN_BUTTON_MRS = {id: "loginButton"}

  def initialize
    super
    visit
  end

  def user_name
    @@driver.find_element(USER_NAME_MRS)
  end

  def password
    @@driver.find_element(PASSWORD_MRS)
  end

  def login_button
    @@driver.find_element(LOGIN_BUTTON_MRS)
  end

  def location(location_name)
    @@driver.find_element(:xpath, "//li[@id ='#{location_name}']")
  end

  private

  def visit
    @@driver.get "https://demo.openmrs.org"
  end
end