require 'spec_helper'

feature 'Testing site cloudBees.com' do
  scenario 'Test example' do
    visit 'https://ectest.trueautomation.io/flow/#logout'

    find(:xpath, ta('cloudBees:loginPage:userNameFld', "//input[@name='username']")).set("admin")
    find(:xpath, ta('cloudBees:loginPage:passwordFld', "//input[@name='password']")).set("changeme")
    find(:xpath, ta('cloudBees:loginPage:signInBtn', "//button")).click
    sleep 2 # wait for load page

    find(:css, ta('cloudBees:homePage:menuLink', ".at-main-menu-btn")).click
    find(:xpath, ta('cloudBees:homePage:usersLink', "//a[./span[text()='Users']]")).click
    sleep 2 # wait for load page

    within_frame(find(:css, ta('cloudBees:usersPage:usersFrame', ".embedded-iframe"))) do
      find(:xpath, ta('cloudBees:usersPage:createLocalUserLink', "//td[@id='pageHeader_actionList_actionList0']/a")).click
    end
    sleep 2 # wait for load page

    within_frame(find(:css, ta('cloudBees:newUsersPage:usersFrame', ".embedded-iframe"))) do
      find(:css, ta('cloudBees:newUsersPage:userNameFld', "[id=userName]")).set("Igor")
      find(:css, ta('cloudBees:newUsersPage:fullUserNameFld', "[id=fullUserName]")).set("Shapovalov")
      find(:css, ta('cloudBees:newUsersPage:emailFld', "[id=email]")).set("email.com")
      find(:css, ta('cloudBees:newUsersPage:passwordFld', "[id=password]")).set("Test1111")
      find(:css, ta('cloudBees:newUsersPage:passwordConfirmFld', "[id=password_confirm]")).set("Test1111")
      find(:css, ta('cloudBees:newUsersPage:okBtn', "[id=submitButton]")).click
    end
    sleep 2 # wait for load page

    within_frame(0) do
      find(:css, ta('cloudBees:usersPage:filterFld', "[id=filter]")).set("Igor")
      sleep 2 # wait for filter to be apply

      find(:css, ta('cloudBees:usersPage:okBtn', "[id=submitButton]")).click
      find(:css, ta('cloudBees:usersPage:deleteIcon', ".delete-icon")).click
      find(:xpath, ta('cloudBees:usersPage:confirmDelete', "//div[@id='jsDialogWindow']//input[@value='OK']")).click
    end

    sleep 3
  end
end