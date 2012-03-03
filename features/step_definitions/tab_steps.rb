# the differences in casing here are because
# selenium only matches the uppercase version because
# of css on the page which transforms the text to uppercase
Then /^I should see a tab with the title "(.*?)"$/ do |title|
  page.should have_css('.tabs li a', :text => title)
end

Then /^I click the "(.*?)" tab$/ do |title|
  page.find('.tabs li a', :text => title.upcase).click
end
