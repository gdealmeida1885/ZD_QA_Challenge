require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'
require 'httparty'

Capybara.configure do |c|
  c.default_max_wait_time = 5
  c.default_driver = :selenium_chrome
  c.app_host = 'https://www.ze.delivery/'
  Capybara.page.driver.browser.manage.window.maximize
end

INVALID_CREDENTIALS_DATA = YAML.load(File.read('features\data\invalid_credentials.yml'))
