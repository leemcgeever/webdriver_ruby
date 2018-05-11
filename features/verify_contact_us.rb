require "selenium-webdriver"
require "rspec"
require_relative "pages/contact_page.rb"

contactname   = "Contact Page User"
email         = "email@email.com"
phone         = "01273123456"
company_name  = "Company Name"
message       = "This is a test contact us form message"

#Test:  Sigm up for blog
describe "Jellyfish website" do
  describe "complete the contact us form" do
    it "confirm that the user can complete the contact us form" do
      @driver = Selenium::WebDriver.for :firefox
      # Go to signup form
      @driver.navigate.to "https://jellyfish-test.jellyfish.co.uk/"
      #fill out and submit the form
      contact = ContactPage.new(@driver)

      #Check if the cookie popup is present, close if it is
      contact.close_cookie_popup

      # Fill the form in
      contact.enter_contact_name(contactname)
      contact.enter_email(email)
      contact.enter_phone(phone)
      contact.enter_company_name(company_name)
      contact.select_service_line
      contact.enter_message(message)
      contact.click_signup_checkbox
      contact.verify_submit_button

      #verify that the submit button is present (not clicked)
      contact.verify_submit_button

      @driver.quit
    end
  end
end
