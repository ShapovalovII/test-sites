require 'spec_helper'

feature 'Testing site annieselke.com' do
  scenario 'Successful registration' do
    visit 'https://annieselke.com/'

    find(:xpath, ta('annieselke:homePage:loginLink', "//a[@href='/login']")).click

    find(:xpath, ta('annieselke:loginPage:createNewAccount', "//h3[text()='Create an Account']")).click

    # if expect(page).to have_xpath("//iframe[contains(@title, 'Sign up')]", wait: 20)
    #   within_frame(find(:xpath, ta('annieselke:loginPage:frameAd', "//iframe[contains(@title, 'Sign up')]"))) do
    #     find(:xpath, ta('annieselke:loginPage:closeAd', "//span[text()='X']")).click
    #   end
    # end

    select ta("annieselke:loginPage:titleDropDown", "Mr"), :from => "register.title"

    find(:xpath, ta('annieselke:loginPage:firstNameFld', "//input[@id='register.firstName']")).set("Igor")
    find(:xpath, ta('annieselke:loginPage:lastNameFld', "//input[@id='register.lastName']")).set("Shapovalov")

    email = Random.rand(50..50000000)
    find(:xpath, ta('annieselke:loginPage:emailFld', "//input[@id='register.email']")).set('igor' + email.to_s + '@gmail.com')

    find(:xpath, ta('annieselke:loginPage:passwordFld', "//input[@id='password']")).set("Test1111")
    find(:xpath, ta('annieselke:loginPage:confirmPasswordFld', "//input[@id='register.checkPwd']")).set("Test1111")
    find(:xpath, ta('annieselke:loginPage:subscribe', "//label[@for='subscribe']")).click

    find(:xpath, ta('annieselke:loginPage:registerBtn', "//button[text()='Register']")).click

    sleep 3
  end
end
