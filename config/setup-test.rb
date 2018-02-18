require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'yaml'
require 'pry'

include Capybara::DSL
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    url: "http://selenium:4444/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome)
end

Capybara.default_driver = :selenium

Capybara.app_host = "http://web:3000"
Capybara.server_host = '0.0.0.0'
Capybara.server_port = '3000'
