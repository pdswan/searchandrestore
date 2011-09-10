Then /^I choose "([^"]+)" from the datepicker$/ do |date|
  within('.hasDatepicker') do
    page.find("a", :text => date.split('-').second.gsub(/^0/, '')).click
  end
end
