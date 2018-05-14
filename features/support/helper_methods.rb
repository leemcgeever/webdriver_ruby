# Generic Helper methods
class HelperMethods
  # css selectors
  CAPTCHA = { id: '#g-recaptcha' }.freeze

  # class method
  def initialize(driver)
    @driver = driver
  end

  # Validate that the captcha is present
  def validate_captcha
    driver.find_element(CAPTCHA).displayed?
  end
end
