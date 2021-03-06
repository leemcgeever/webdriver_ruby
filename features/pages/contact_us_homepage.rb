# selectors and methods for use in verify homepage contact us page
class ContactUsHomePage
  # css selectors
  NAME_FIELD = { id: 'edit-submitted-column1-name' }.freeze
  EMAIL_FIELD          = { id: 'edit-submitted-column1-email' }.freeze
  PHONE_FIELD          = { id: 'edit-submitted-column1-phone' }.freeze
  COMPANY_NAME_FIELD = { id: 'edit-submitted-column1-company-name' }.freeze
  INTEREST_SELECTOR    = { id: 'contactServiceMenu' }.freeze
  MESSAGE_INPUT_BOX    = { id: 'edit-submitted-column3-message' }.freeze
  SIGN_UP_CHECKBOX = { id: 'edit-submitted-column3-sign-up-for-jellyfish-communications-1' }.freeze
  SUBMIT_BUTTON        = { css: '.webform-submit' }.freeze # Get in touch button
  COOKIE_POPUP         = { css: '.cookies-box' }.freeze
  CLOSE_COOKIE_BUTTON = { css: '.add-cookies' }.freeze

  # css error messages
  NAME_FIELD_ERROR = { id: 'edit-submitted-column1-name-error' }.freeze

  attr_reader :driver

  # class method
  def initialize(driver)
    @driver = driver
  end

  def enter_contact_name(contactname)
    contact_name = driver.find_element(NAME_FIELD)
    contact_name.send_keys(contactname)
  end

  def enter_email(email)
    email_field = driver.find_element(EMAIL_FIELD)
    email_field.send_keys(email)
  end

  def enter_phone(phone)
    phone_field = driver.find_element(PHONE_FIELD)
    phone_field.send_keys(phone)
  end

  def enter_company_name(company_name)
    company_name_field = driver.find_element(COMPANY_NAME_FIELD)
    company_name_field.send_keys(company_name)
  end

  # The method selects the first option from the select list
  # it's item 2 on list as the first one is "Select Service" hardcoded message
  # this should be a watermark not a list option!!
  def select_service_from_list
    driver.find_element(INTEREST_SELECTOR).click
    driver.find_element(css: '.mdl-menu > li:nth-of-type(2)').click
  end

  def enter_message(message)
    message_field = driver.find_element(MESSAGE_INPUT_BOX)
    message_field.send_keys(message)
  end

  def click_signup_checkbox
    driver.find_element(SIGN_UP_CHECKBOX).click
  end

  def verify_submit_button
    driver.find_element(SUBMIT_BUTTON).displayed?
  end
end
