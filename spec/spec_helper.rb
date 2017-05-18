require "watir_drops"
require "watir_model"
require "rspec"
require "sauce_whisk"
require 'require_all'

require_rel "support"

RSpec.configure do |config|
  config.include SauceHelpers

  config.before(:each) do |test|
    #@browser = initialize_driver(test.full_description)
    @browser = Watir::Browser.new
    WatirDrops::PageObject.browser = @browser
  end

  config.after(:each) do |example|
    submit_results(@browser.wd.session_id, !example.exception) if @browser.wd.respond_to? :session_id
    @browser.quit
  end
end
