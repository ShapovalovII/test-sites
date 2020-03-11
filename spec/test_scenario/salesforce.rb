require 'spec_helper'

feature 'Testing site login.salesforce.com' do
  scenario 'Successful registration' do
    visit 'https://login.salesforce.com/'
    sleep 2 # waiting for loaded page

    switch_to_frame(find(:xpath, ta('salesforce:loginPage:userNameFrame', "//iframe[@name='marketing']")))

    find(:xpath, ta("salesforce:loginPage:startMyFreeTrialLink", "(//a[contains(@class, 'btn-lg')])[2]")).click


    last_handle = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(last_handle)


    find(:xpath, ta('salesforce:signUpPage:userNameField', "//input[@name='UserFirstName']")).set('Igor')
    find(:xpath, ta('salesforce:signUpPage:userLastField', "//input[@name='UserLastName']")).set('Shapovalov')

    email = Random.rand(50..50000000)
    find(:xpath, ta('salesforce:signUpPage:emailField', "//input[@name='UserEmail']")).set('igor' + email.to_s + '@gmail.com')

    find(:xpath, ta('salesforce:signUpPage:jobTitleField', "//input[@name='UserTitle']")).set('SomeNewJob')
    find(:xpath, ta('salesforce:signUpPage:phoneField', "//input[@name='UserPhone']")).set('380730960589')

    select ta("salesforce:signUpPage:employeesDropDown", "1 - 20 employees"), :from => "CompanyEmployees"
    select ta("salesforce:signUpPage:countryDropDown", "Ukraine"), :from => "CompanyCountry"

    find(:xpath, ta('salesforce:signUpPage:subscriptionCheckbox', "(//div[@class='checkbox-ui'])[1]")).click
    find(:xpath, ta('salesforce:signUpPage:startMyFreeTrialBtn', "//button[@name='start my free trial']")).click

    sleep 5
  end
end
