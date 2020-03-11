require 'spec_helper'

feature 'Testing site facebook.com' do
  scenario 'Negative registration' do
    visit 'https://www.facebook.com/'

    find(:xpath, ta('facebook:homePage:UkraineLink', "//a[@href='https://uk-ua.facebook.com/']")).click
    find(:xpath, ta('facebook:homePage:registrationLink', "//a[@href='/r.php']")).click

    find(:xpath, ta('facebook:registrationPage:FirstNameFld', "//input[@name='firstname']")).set("Igor")
    find(:xpath, ta('facebook:registrationPage:LastNameFld', "//input[@name='lastname']")).set("Shapovalov")
    find(:xpath, ta('facebook:registrationPage:emailFld', "//input[@name='reg_email__']")).set("email.com")
    find(:xpath, ta('facebook:registrationPage:passwordFld', "//input[@name='reg_passwd__']")).set("Test111111!")

    select ta("facebook:registrationPage:dayDropDown", "7"), :from => "day"
    find(:xpath, ta("facebook:registrationPage:monthDropDown", "//select[@id='month']")).
         find(:xpath, ta("facebook:registrationPage:monthApril",'option[5]')).select_option
    select ta("facebook:registrationPage:yearDropDown", "2000"), :from => "year"

    find(:xpath, ta('facebook:registrationPage:Man', "//input[@id='u_0_b']")).click

    find(:xpath, ta('facebook:registrationPage:registrationBtn', "//button[@name='websubmit']")).click

    actual_text = find(:xpath, ta('facebook:registrationPage:emailError', " //div[contains(@style,'top: 0px')]")).text
    expected_text = 'Введіть дійсний номер мобільного телефону або електронну адресу.'
    expect(actual_text).to eql expected_text

    sleep 3
  end
end
