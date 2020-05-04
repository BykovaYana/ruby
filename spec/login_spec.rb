require 'spec_helper'
require_relative '../steps/login_steps'
require_relative '../steps/home_steps'

context 'When user login with valid data' do
  it 'Home page should be opened' do
    login_steps = LoginSteps.new
    home_steps = HomeSteps.new
    login = 'admin'
    password = 'Admin123'
    location = 'Inpatient Ward'
    login_steps.login(login, password, location)
    name = home_steps.get_account_name
    expect(name).to eq login
  end
end
