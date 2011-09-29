Then /^I fill in the new press clipping form with valid attributes$/ do
  Then %{I fill in "Source" with "New York Times"}
  And  %{I fill in "Author" with "Dave Thomas"}
  And  %{I choose the date "2011-09-25" from "press_clipping_date"}
  And  %{I fill in "Title" with "Article about bowel movements"}
  And  %{I fill in "Url" with "http://www.google.com"}
end

Then /^I should see the press clipping$/ do
  Then %{I should see "#{the.press_clipping.source}"}
  And  %{I should see "#{the.press_clipping.author}"}
  And  %{I should see "#{the.press_clipping.date.strftime("%m/%d/%Y")}"}
  And  %{I should see a link to "#{the.press_clipping.link.url}" with the text "#{the.press_clipping.link.title}"}
end
