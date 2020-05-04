require_relative '../page/base_page'

class AddNewTaskPage < BasePage
  NAME = {xpath: "//input[@ng-model= 'taskName']"}
  START_TIME = {xpath: "//input[@ng-model= 'startTimeVal']"}
  REPREATE_INTERVAL = {xpath: "//input[@ng-model= 'repeatInterval']"}
  START_ON_STARTUP = {id: 'startOnStartup'}

  def schedulableclass(task)
    @@driver.find_element(xpath: "//select[@ng-model= 'schedulableClass']//option[. = '#{task}']")
  end

  def start_on_startup
    @@driver.find_element(START_ON_STARTUP)
  end

  def repreat_intervel
    @@driver.find_element(REPREATE_INTERVAL)
  end

  def repreat_intervel_unit(unit)
    @@driver.find_element(xpath: "//select[@ng-model ='repeatIntervalType']//option[. = '#{unit}']")
  end

  def start_time
    @@driver.find_element(START_TIME)
  end
end
