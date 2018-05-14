class MenuContactUsPage

  #css selectors
  NAME_FIELD 					= {id: 'edit-submitted-row1-column1-name'}
  EMAIL_FIELD					= {id: 'edit-submitted-row1-column2-email'}
  PHONE_FIELD					= {id: 'edit-submitted-row1-column1-phone'}
  COMPANY_NAME_FIELD	= {id: 'edit-submitted-row1-column2-company-name-optional'}
  MESSAGE_INPUT_BOX		= {id: 'edit-submitted-message'}
  INTEREST_CHECKBOX 	= {id: 'edit-submitted-are-there-any-particular-services-that-you-are-interested-in-2'}
  SIGN_UP_CHECKBOX		= {id: 'edit-submitted-sign-up-for-jellyfish-communications-1'}
  SUBMIT_BUTTON				= {css: '.webform-submit' } #Get in touch button

  attr_reader	:driver

  # class method
  def initialize(driver)
  	@driver = driver
  end

  def enter_contact_us_name(menu_contact_name)
  	contact_name = driver.find_element(NAME_FIELD)
  	contact_name.send_keys(menu_contact_name)
  end

  def enter_contact_us_email(menu_email)
  	email_field = driver.find_element(EMAIL_FIELD)
  	email_field.send_keys(menu_email)
  end

  def enter_contact_us_phone(menu_phone)
  	phone_field = driver.find_element(PHONE_FIELD)
  	phone_field.send_keys(menu_phone)
  end

  def enter_contact_us_company_name(menu_company)
  	company_name_field = driver.find_element(COMPANY_NAME_FIELD)
  	company_name_field.send_keys(menu_company)
  end

  def enter_message(menu_message)
  	message_field = driver.find_element(MESSAGE_INPUT_BOX)
  	message_field.send_keys(menu_message)
  end

  # Select the first service checkbox
  def select_service_checkbox
  	service_selection = driver.find_element(INTEREST_CHECKBOX).click
  end

  def click_signup_checkbox
  	driver.find_element(SIGN_UP_CHECKBOX).click
  end

  def verify_submit_button
  	driver.find_element(SUBMIT_BUTTON).displayed?
  end

end
