require_relative '../page/base_page'

class BaseSteps
  def initialize
    @@base_page = BasePage.new
  end

  def get_account_name
    return @@base_page.user_account_drop_down.text
  end

  def navigate_to_home_page
    @@base_page.home.click
  end

end

