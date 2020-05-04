require_relative '../page/base_page'

class ManageSchedulerPage < BasePage
  def button(name)
    @@driver.find_element(xpath: "//button[text()[contains(.,'#{name}')]]")
  end
end
