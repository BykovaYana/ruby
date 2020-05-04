require 'spec_helper'

RSpec.describe 'Administration' do
  include LoginHelper

  let(:home_page_steps) { HomeSteps.new }
  let(:administration_steps) { AdministrationSteps.new }

  before(:all) do
    login
  end

  context 'Create new task' do
    it 'verify task creation with valid data' do
      home_page_steps.navigate_to_home_page
      home_page_steps.navigate_to_page('System Administration')
      home_page_steps.navigate_to_page('Manage Scheduler')

    end
  end
  end
