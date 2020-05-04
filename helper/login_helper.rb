require_relative '../steps/login_steps'

module LoginHelper
  def login
    login_steps = LoginSteps.new
    login = 'admin'
    password = 'Admin123'
    location = 'Inpatient Ward'
    login_steps.login(login, password, location)
  end
end
