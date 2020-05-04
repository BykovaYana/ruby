require 'spec_helper'

RSpec.describe 'Patient' do
  include LoginHelper

  let(:home_page_steps) { HomeSteps.new }
  let(:patient_steps) { PatientSteps.new }

  def get_patient
    patient_json = File.read('/Users/yanaborodulina/Documents/OpenMrs/helper/patient_data.json')
    JSON.parse(patient_json)
  end

  before(:all) do
    login
  end

  context 'Search a patient' do
    let(:patient_name) { 'John' }
    it 'verify searching result table' do
      home_page_steps.navigate_to_page('Find Patient Record')
      patient_steps.search_patient(patient_name)
      results = patient_steps.searching_result
      results.each do |result|
        expect(result).to include(patient_name)
      end
    end
  end

  context 'Patient actions' do
    let (:patient) { get_patient }

    before :each do
      home_page_steps.navigate_to_home_page
      home_page_steps.navigate_to_page('Register a patient')
    end

    it 'verify new user creation' do
      patient_steps.create_patient(patient['valid_user'])
      new_patient_data = patient_steps.get_patient_data
      patient_name = patient['Name']
      new_patient_data.each do |key, value|
        expect(value).to eq(patient_name[key])
      end
    end

    it 'verify user creation with out name' do
      patient_steps.create_patient(patient['user_without_name'])
      new_patient_data = patient_steps.get_patient_data
      patient_name = {
          "given_name" => "UNKNOWN",
          "family_name" => "UNKNOWN"
      }
      patient_name['given_name'] = "UNKNOWN"
      patient_name['family_name'] = "UNKNOWN"
      new_patient_data.each do |key, value|
        expect(value).to eq(patient_name[key])
      end
    end
  end
end