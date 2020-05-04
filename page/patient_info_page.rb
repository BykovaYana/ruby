require_relative 'base_page'

class PatientInfoPage < BasePage
  GIVEN_NAME = {class: 'PersonName-givenName'}
  FAMILY_NAME ={class: 'PersonName-familyName'}

  def given_name
    @@driver.find_element(GIVEN_NAME)
  end

  def family_name
    @@driver.find_element(FAMILY_NAME)
  end
end
