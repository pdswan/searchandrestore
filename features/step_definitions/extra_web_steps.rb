Then /^I should see the "([^"]+)" of the (.+)$/ do |attribute, object|
  object = object.gsub(/\s+/, '_')
  object = the.send(object) || object.capitalize.constantize.last

  Then %{I should see "#{object.send(attribute)}"}
end
