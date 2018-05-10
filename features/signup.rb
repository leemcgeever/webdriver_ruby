require "selenium-webdriver"
require "rspec"
require_relative "pages/signup_page.rb"
require_relative "pages/users_page.rb"

timestamp             = Time.now.to_i
username              = "user #{timestamp}"
email                 = "email#{timestamp}@test.com"
password              = "password"
expected_banner_text  = "Welcome to the alpha blog user #{timestamp}"

#Test:  Sigm up for blog
describe "Blog Application" do
  describe "signup to the blog application" do
    it "confirm that the user can successfully signup" do
      @driver = Selenium::WebDriver.for :firefox
      # Go to signup form
      @driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
      #fill out and submit the form
      signup = SignupPage.new(@driver)
      signup.enter_username(username)
      signup.enter_email(email)
      signup.enter_password(password)
      signup.submit_form

      #Confirm user is signedup
      users = UsersPage.new(@driver)
      banner_text = users.get_banner_text()
      expect(banner_text).to eq(expected_banner_text)
      @driver.quit
    end
  end
end
