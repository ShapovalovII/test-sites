require 'bundler/setup'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'


$caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
$caps_chrome['goog:chromeOptions'] = {}
$caps_chrome['goog:chromeOptions']['args'] = ['--disable-notifications']
$caps_chrome['goog:chromeOptions']['args'] = ['--ignore-ssl-errors=yes']
$caps_chrome['goog:chromeOptions']['args'] = ['--ignore-certificate-errors']

RSpec.configure do |config|
  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app, desired_capabilities: $caps_chrome)
  end

  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 20

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL


  config.after(:context) do
    Capybara.current_session.driver.quit
  end
end
