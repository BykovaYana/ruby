require_relative 'base_steps'
require_relative '../page/home_page'

class HomeSteps < BaseSteps
  def initialize
    @@home_page = HomePage.new
    super
  end

  def navigate_to_page(name)
    @@home_page.main_menu_element(name).click
  end
end
