class HomePage
  # css selectors
  MENU = { css: '.top-menu' }.freeze
  CONTACTUS = { css: '.top-menu > li:nth-child(11) > a:nth-child(2)' }.freeze
  COOKIE_POPUP = { css: '.cookies-box' }.freeze
  CLOSE_COOKIE_BUTTON = { css: '.add-cookies' }.freeze

  attr_reader :driver

  # class method
  def initialize(driver)
    @driver = driver
  end

  def close_cookie_popup
    sleep 3
    if driver.find_element(COOKIE_POPUP).displayed?
      then driver.find_element(CLOSE_COOKIE_BUTTON).click
    else
      console.log 'Cookie popup not present'
    end
  end

  def is_main_menu_open
    if driver.find_element(MENU).displayed?
      then contact_us_link
    else
      open_main_menu
      contact_us_link
    end
  end

  def open_main_menu
    driver.find_element(MENU).click
  end

  def contact_us_link
    driver.find_element(CONTACTUS).click
  end
end
