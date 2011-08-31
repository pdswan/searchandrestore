Then /^I should see the "([^"]+)" of the (.+)$/ do |attribute, object|
  object = object.gsub(/\s+/, '_')
  object = the.send(object) || object.capitalize.constantize.last

  Then %{I should see "#{object.send(attribute)}"}
end

Then /^I ommit "([^"]+)"$/ do |field|
  Then %{I fill in "#{field}" with ""}
end

Then /^I should see a link to "([^"]+)"(?: with the text "([^"]+)")?$/ do |url, text|
  options = { }
  options.merge!(:text => text) if text.present?
  page.should have_css("a[href='#{url}']", options)
end
