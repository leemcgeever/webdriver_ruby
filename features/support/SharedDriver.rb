require 'rubygems'
require 'rspec'
require 'watir-webdriver'

include Selenium

#Creating Remote WebDriver
browser = Webdriver::Browser.new(:remote, :url =&gt; "http://SauceUsername:SauceKey@ondemand.saucelabs.com:80/wd/hub",
                              :desired_capabilities =&gt; WebDriver::Remote::Capabilities.firefox)
#If you want to run it locally, use Watir::Browser.new :firefox
							  
Before do
  @browser 