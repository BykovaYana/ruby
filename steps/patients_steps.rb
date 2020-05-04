require_relative '../page/find_patient_record_page'
require_relative '../page/register_patient_page'
require_relative '../page/patient_info_page'

class PatientSteps
  def initialize
    @@find_patient_page = FindPatientRecordPage.new
    @@register_patient_page = RegisterPatientPage.new
    @@patient_info_page = PatientInfoPage.new
  end

  def search_patient(name)
    if headers_correct?
      @@find_patient_page.search_field.send_keys(name)
    else
      raise 'Incorrect table headers'
    end
  end

  def searching_result(column_name = 'Name')
    searching_results = @@find_patient_page.column_items(column_name)
    until @@find_patient_page.element_disabled?(@@find_patient_page.next_button)
      p @@find_patient_page.next_button.enabled?
      @@find_patient_page.next_button.click
      page_results = @@find_patient_page.column_items(column_name)
      page_results.each do |result|
        searching_results.push(result)
      end
    end
    return searching_results
  end

  def create_patient(patient)
    menu = patient.keys
    menu.each do |key|
      switch_to_section(key)
      if key == 'Relatives'
        select_relatives(patient[key])
      else
        fill_data (patient[key])
      end
    end
    switch_to_section('Confirm')
    @@register_patient_page.confirm.click
  end

  def get_patient_data
    patient_data = Hash.new
    patient_data['family_name'] = @@patient_info_page.family_name.text
    patient_data['given_name'] = @@patient_info_page.given_name.text
    return patient_data
  end

  private

  def headers_correct?
    table_headers = %w[Identifier Name Gender Age Birthdate]
    column_headers = @@find_patient_page.columns_headers
    return column_headers.to_set == table_headers.to_set
  end

  def switch_to_section(section)
    @@register_patient_page.demographic_menu(section).click
  end

  def select_relatives(relatives)
    relatives.each do |type, name|
      @@register_patient_page.relatives_type(type).click
      @@register_patient_page.relative_name.send_keys(name)
    end
  end

  def fill_data(patient)
    patient.each do |key, value|
      if key == 'unidentified_patient'
        @@register_patient_page.unidentified_patient.click if value == 'true'
      elsif key == 'month'
        @@register_patient_page.month(value).click
      elsif key == 'gender'
        @@register_patient_page.gender(value).click
      else
        @@register_patient_page.send(key.to_sym).send_keys(value)
      end
    end
  end
end
