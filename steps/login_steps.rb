require_relative '../page/login_page'

class LoginSteps
  def initialize
    @@login_page = LoginPage.new
  end

  def login(login, password, location)
    user_name_fill(login)
    password_fill(password)
    select_location(location)
    login_button_click
  end

  private

  def user_name_fill(login)
    @@login_page.user_name.send_keys login
  end

  def password_fill(password)
    @@login_page.password.send_keys password
  end

  def login_button_click
    @@login_page.login_button.click
  end

  def select_location(location)
    @@login_page.location(location).click
  end
end
