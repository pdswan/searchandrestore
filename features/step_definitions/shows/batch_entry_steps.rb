Then /^I create a batch entry session$/ do
  Then %{I follow "Start batch entry"}
  And  %{I select "#{the.venue.name}" from "Venue"}
  And  %{I fill in "Group name" with "Batch group name"}
  And  %{I fill in "Description" with "Batch description"}
  And  %{I press "Start"}
end

Given /^I have created a batch entry session$/ do
  Then %{I go to the admin shows page}
  And  %{I create a batch entry session}
end

Then /^the fields should be populated with the data from the batch entry session$/ do
  Then %{the "Group name" field should contain "Batch group name"}
  Then %{the "Description" field should contain "Batch description"} 
end

Then /^the fields should not be populated with any data$/ do
  find_field("Group name").value.should be_blank
  find_field("Description").value.should be_blank
end
