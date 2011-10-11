Then /^I create a new batch entry session$/ do
  Then %{I follow "Start batch"}
  And  %{I select "#{the.venue.name}" from "Venue"}
  And  %{I fill in "Group name" with "Batch group name"}
  And  %{I fill in "Description" with "Batch description"}
  And  %{I press "Start"}
end

Then /^the fields should be populated with the data from the batch entry session$/ do
  Then %{the "Group name" field should contain "Batch group name"}
  Then %{the "Description" field should contain "Batch description"} 
end
