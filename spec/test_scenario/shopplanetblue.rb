require 'spec_helper'

feature 'Testing site shopplanetblue.com' do

  before(:example) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone X'}
  end

  scenario 'Add product to cart' do
    visit 'https://shopplanetblue.com/'

    find(:xpath, ta('shopplanetblue:homePage:menuBtn', "//button[@aria-label='Menu']")).click

    find(:xpath, ta('shopplanetblue:homePage:clothingMenu', "//div[./div[text()='Clothing']]")).click
    find(:xpath, ta('shopplanetblue:homePage:clothingTopsMenu', "//div[./div[text()='Tops']]")).click
    find(:xpath, ta('shopplanetblue:homePage:clothingTopsBasicsMenu', "//div[./div[text()='Basics']]")).click

    find(:xpath, ta('shopplanetblue:basic_teesPage:seabraTopNew', "//a[contains(., 'SEABRA TOP | New')]")).click
    page.execute_script "window.scrollTo(0,200)" # lazy loading

    find(:xpath, ta('shopplanetblue:productPage:thirdPicture', "//button[@aria-label='dot-button-2']")).click
    page.execute_script "window.scrollTo(0,800)" # lazy loading

    find(:xpath, ta('shopplanetblue:productPage:colorIvory', "//button[@aria-label='IVORY']")).click
    find(:xpath, ta('shopplanetblue:productPage:sizeGuide', "//a[contains(., 'Size Guide')]")).click
    find(:xpath, ta('shopplanetblue:productPage:closeSizeGuide', "//button[@style='']")).click

    find(:xpath, ta('shopplanetblue:productPage:sizeM', "//button[./span[text()='M']]")).click
    find(:xpath, ta('shopplanetblue:productPage:addToBag', "//button[./span[text()='Add to Bag']]")).click

    find(:xpath, ta('shopplanetblue:productPage:closeModalBag', "//button[@style='']")).click

    sleep 3
  end
end
