Given /^there (?:is|are) (an?|[0-9]+) ([A-z _]+)(?: with:)?$/ do |count, factory, *args|
  count   = [1, count.to_i].max
  attrs   = args.first.try(:rows_hash) || { }

  count.times do
    Factory(factory_name(factory), attrs)
  end
end

def factory_name(str)
  str.singularize.gsub(/\s+/, '_').downcase.intern
end
