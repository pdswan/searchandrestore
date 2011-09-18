Then /^I should see the venues?$/ do
  Venue.all.each do |v|
    Then %{I should see "#{v.name}"}
    Then %{I should see "#{v.city}"}
    Then %{I should see a link to "#{url_for(v)}"}
  end
end

Then /^I should see the venue details$/ do
  Then %{I should see "#{the.venue.name}"}
  And  %{I should see "#{the.venue.address}"}
  And  %{I should see "#{the.venue.capacity}"}
  And  %{I should see "#{the.venue.age_restriction}"}
  And  %{I should see "#{the.venue.food_and_drink}"}
  And  %{I should see "#{the.venue.price_and_discount_info}"}

  And  %{I should see a link to "#{the.venue.website}"} if the.venue.website.present?
  
  [:music_every_night?, :reservations?].each do |m|
    text = the.venue.send(m) ? 'Yes' : 'No'
    page.should have_css(".#{m.to_s.gsub(/\?$/, '')}", :text => text)
  end
  
  [:their_words, :our_words].each do |m|
    the.venue.send(m).split("\n").each do |p|
      Then %{I should see "#{p}"}
    end
  end
end

Then /^I should see the upcoming shows at the venue$/ do
  within('#upcoming-shows') do
    the.venue.shows.upcoming.each do |show|
      Then %{I should see "#{show.group_name}"}
      And  %{I should see a link to "#{url_for(show.venue)}" with the text "#{show.venue.name}"}
    end
  end
end
