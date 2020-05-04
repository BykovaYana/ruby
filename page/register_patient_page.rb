require_relative 'base_page'

class RegisterPatientPage < BasePage
  GIVEN = {xpath: "//input[@name = 'givenName']"}
  MIDDLE = {xpath: "//input[@name = 'middleName']"}
  FAMILY_NAME = {xpath: "//input[@name = 'familyName']"}
  UNDEFINED_PATIENT = {id: 'checkbox-unknown-patient'}
  DAY = {id: 'birthdateDay-field'}
  YEAR = {id: 'birthdateYear-field'}
  MONTH_DROPDOWN = {id: 'birthdateMonth-field'}
  ADDRESS1 = {id: 'address1'}
  ADDRESS2 = {id: 'address2'}
  CITY = {id: 'cityVillage'}
  STATE = {id: 'stateProvince'}
  COUNTRY = {id: 'country'}
  POSTAL_CODE = {id: 'postalCode'}
  PHONE_NUMBER = {xpath: "//input[@name = 'phoneNumber']"}
  CONFIRM = {id: 'submit'}
  RELATIVE_NAME = {xpath: "//input[@placeholder= 'Person Name']"}

  def given_name
    @@driver.find_element(GIVEN)
  end

  def middle_name
    @@driver.find_element(MIDDLE)
  end

  def family_name
    @@driver.find_element(FAMILY_NAME)
  end

  def unidentified_patient
    @@driver.find_element(UNDEFINED_PATIENT)
  end

  def gender(value)
    @@driver.find_element(:xpath, "//select[@id = 'gender-field']//option[.='#{value}']")
  end

  def day
    @@driver.find_element(DAY)
  end

  def month(value)
    @@driver.find_element(:xpath, "//select[@id = 'birthdateMonth-field']//option[.='#{value}']")
  end

  def year
    @@driver.find_element(YEAR)
  end

  def address1
    @@driver.find_element(ADDRESS1)
  end

  def address2
    @@driver.find_element(ADDRESS2)
  end

  def city
    @@driver.find_element(CITY)
  end

  def state
    @@driver.find_element(STATE)
  end

  def country
    @@driver.find_element(COUNTRY)
  end

  def postal_code
    @@driver.find_element(POSTAL_CODE)
  end

  def phone_number
    @@driver.find_element(PHONE_NUMBER)
  end

  def relatives_type(type)
    @@driver.find_element(:xpath, "//select[@id ='relationship_type']//option[.='#{type}']")
  end

  def relative_name
    @@driver.find_element(RELATIVE_NAME)
  end

  def confirm
    @@driver.find_element(CONFIRM)
  end
  def demographic_menu(menu_item)
    @@driver.find_element(:xpath, "//ul[@id ='formBreadcrumb']//span[.='#{menu_item}']")
  end
end