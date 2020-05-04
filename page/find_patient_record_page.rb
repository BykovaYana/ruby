require_relative 'base_page'
require 'set'

class FindPatientRecordPage < BasePage
  PATIENT_TABLE = {id: 'patient-search-results-table'}
  COLUMN_HEADERS = {xpath: "//th[@role = 'columnheader']//div"}
  SEARCH_FIELD = {id: 'patient-search'}
  NEXT_BUTTON = {id: 'patient-search-results-table_next'}

  def patient_table
    @@driver.find_element(PATIENT_TABLE)
  end

  def search_field
    @@driver.find_element(SEARCH_FIELD)
  end

  def columns_headers
    headers = patient_table.find_elements(COLUMN_HEADERS)
    return get_text(headers)
  end

  def column_items(name)
    sleep 3
    index = column_index(name)
    cells = @@driver.find_elements(:xpath, "//td[#{index}]")
    return get_text(cells)
  end

  def next_button
    @@driver.find_element(NEXT_BUTTON)
  end

  private

  def column_index(name)
    headers_list = columns_headers
    return headers_list.index(name) + 1
  end

  def get_text(web_elements_list)
    text_list = []
    web_elements_list.each do |el|
      text = el.text
      text_list.push(text)
    end
    return text_list
  end

end
