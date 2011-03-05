Then /^I log\s?in with "([^"]+)" and "([^"]+)"$/ do |email, password|
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
  page.should have_content("Signed in successfully.")
end

Given /^I am logged in as an admin user$/ do
  email = Faker::Internet.email
  password = 'password123'

  the.user = Factory(:admin,
                     :email => email,
                     :password => password,
                     :password_confirmation => password)

  Then %{I go to the login page}
  Then %{I log in with "#{email}" and "#{password}"}
end

Given /^I am not logged in$/ do
  # no-op
end
