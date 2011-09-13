Then /^I should see the venues?$/ do
  Venue.all.each do |v|
    Then %{I should see "#{v.name}"}
    Then %{I should see "#{v.city}"}
    Then "show me the page"
    Then %{I should see a link to "#{url_for(v)}"}
  end
end
