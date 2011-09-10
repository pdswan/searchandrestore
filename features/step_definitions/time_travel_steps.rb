When /^the (date|time|datetime) is "(.+?)"$/ do |type, time_to_parse|
  time = case type
           when 'date'
            Date.parse(time_to_parse)
           when 'time'
            Time.parse(time_to_parse)
           when 'datetime'
            DateTime.parse(time_to_parse)
         end
  Timecop.travel time
end
