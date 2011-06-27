Given /^there is an? ([^\:]+)$/ do |model|
  name = model_name(model)
  the.send(:"#{name}=", Factory(name))
end

Given /^there is an? (.*) with:$/ do |model, table|
  name = model_name(model) 
  the.send(:"#{name}=", Factory(name, table.rows_hash))
end

Then /^I select the (.+) (.+) from "([^"]+)"$/ do |model, attr, field|
  record = the.send(model_name(model))
  Then %{I select "#{record.send(attr.to_sym)}" from "#{field}"}
end

def model_name(model)
  model.gsub(/\s+/, '_').downcase.to_sym
end
