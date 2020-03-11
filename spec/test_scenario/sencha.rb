require 'spec_helper'

feature 'Testing site examples.sencha.com' do
  scenario 'Negative registration' do
    visit 'https://examples.sencha.com/'

    find(:xpath, ta('sencha:homePage:viewJSExamplesBtn', "//a[@href='/extjs' and @class]")).click

    find(:xpath, ta('sencha:extijsPage:startFreeTrialLink', "//a[text()='Start a Free Trial']")).click

    find(:xpath, ta('sencha:extijsEvaluatePage:firstNameFld', "//input[@id='input_18_19']")).set("Igor")
    find(:xpath, ta('sencha:extijsEvaluatePage:lastNameFld', "//input[@id='input_18_20']")).set("Shapovalov")
    find(:xpath, ta('sencha:extijsEvaluatePage:companyFld', "//input[@id='input_18_5']")).set("TestCompany")
    find(:xpath, ta('sencha:extijsEvaluatePage:emailFld', "//input[@id='input_18_2']")).set("email.com")
    find(:xpath, ta('sencha:extijsEvaluatePage:phoneFld', "//input[@id='input_18_3']")).set("0739884821")

    select ta("sencha:extijsEvaluatePage:countryDropDown", "Ukraine"), :from => "input_18_15"
    select ta("sencha:extijsEvaluatePage:operatingSystemDropDown", "Mac OS X"), :from => "input_18_7"

    find(:xpath, ta('sencha:extijsPage:youStudentNo', "//input[@name='input_31' and @value='No']")).click
    find(:xpath, ta('sencha:extijsPage:youCustomerNo', "//input[@name='input_32' and @value='No']")).click

    find(:xpath, ta('sencha:extijsPage:licenseAgreement', "//input[@id='choice_18_9_1']")).click

    actual_text = find(:xpath, ta('sencha:extijsPage:emailError', "//div[contains(@class, 'gfield_description validation_message message_id_input_18_2')]")).text
    expected_text = 'A valid email address is required.'
    expect(actual_text).to eql expected_text

    sleep 3
  end
end
