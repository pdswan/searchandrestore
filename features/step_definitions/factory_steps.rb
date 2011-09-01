Given /^there (?:is|are) (an?|[0-9]+) ([A-z _]+)(?: with:)?$/ do |count, factory, *args|
  count   = [1, count.to_i].max
  attrs   = args.first.try(:rows_hash) || { }

  count.times do
    Factory(factory_name(factory), attrs)
  end
end

def factory_name(str)
  factory, tail = /^([A-z _]+?)([ _]with[A-z _]+)?$/.match(str).to_a[1..-1]
  "#{factoryize(factory.singularize)}#{factoryize(tail)}".intern
end

def factoryize(str)
  str.gsub(/\s+/, '_').downcase rescue ''
end
