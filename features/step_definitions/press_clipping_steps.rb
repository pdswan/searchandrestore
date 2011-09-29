Then /^I fill in the new press clipping form with valid attributes$/ do
  Then %{I fill in "Source" with "New York Times"}
  And  %{I fill in "Author" with "Dave Thomas"}
  And  %{show me the page}
end
