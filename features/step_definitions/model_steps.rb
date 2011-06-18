Given /^there is an? (.*) with:$/ do |model, table|
  name = model.gsub(/\s+/, '_').downcase.to_sym
  the.send(:"#{name}=", Factory(name, table.rows_hash))
end
