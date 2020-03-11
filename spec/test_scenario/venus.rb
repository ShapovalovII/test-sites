require 'spec_helper'

feature 'Testing site venus.com' do

  before(:example) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  scenario 'Add product to cart' do
    visit 'https://www.venus.com/'

    if expect(page).to have_xpath("//input[@id='cc-agreement']", wait: 10)
      find(:xpath, ta('venus:homePage:notificationCookie', "//input[@id='cc-agreement']")).click
    end

    find(:xpath, ta('venus:homePage:menuBtn', "//button[@aria-label='Menu']")).click

    find(:xpath, ta('venus:homePage:swimwearMenu', "//h6[text()='Swimwear']")).click
    find(:xpath, ta('venus:homePage:shopByStyle', "//li[./div[text()='Shop by style']]")).click
    find(:xpath, ta('venus:swimPage:tankiniTops', "//h2[text()='Tankini Tops']")).click

    find(:xpath, ta('venus:productPage:tankiniTop', "(//h2[text()='tankini top'])[1]")).click

    page.execute_script "window.scrollTo(0,500)" # lazy loading

    find(:xpath, ta('venus:viewProductPage:size10', "//span[text()='10']")).click
    find(:xpath, ta('venus:viewProductPage:qtyDropDown', "//div[text()='1' and @role]")).click
    find(:xpath, ta('venus:viewProductPage:qty5', "//li[text()='5' and @role]")).click

    find(:xpath, ta('venus:viewProductPage:addToBagBtn', "//span[text()='Add To Bag']")).click

    sleep 3
  end
end
