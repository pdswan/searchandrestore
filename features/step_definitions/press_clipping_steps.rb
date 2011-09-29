Then /^I fill in the new press clipping form with valid attributes$/ do
  Then %{I fill in "Source" with "New York Times"}
  And  %{I fill in "Author" with "Dave Thomas"}
  And  %{I choose the date "2011-09-25" from "press_clipping_date"}
  And  %{I fill in "Title" with "Article about bowel movements"}
  And  %{I fill in "Url" with "http://www.google.com"}
end
