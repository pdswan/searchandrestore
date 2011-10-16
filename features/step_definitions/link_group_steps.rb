Then /^I create a link group( with links)?$/ do |with_links|
  Then %{I fill in "Name" with "Supporters"}

  if with_links.present?
    Then %{I fill in the new link form with valid attributes}
  end

  And  %{I press "Create Link group"}
end

Then /^I should see the link group name$/ do
  Then %{I should see "#{the.link_group.name}"}
end

Then /^I should see the links from the link group$/ do
  the.link_group.links.each do |link|
    Then %{I should see a link to "#{link.url}" with the text "#{link.title}"}
  end
end
