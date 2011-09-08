Given /^I fill in the new show form with valid attributes$/ do
  Then %{I select "#{the.venue.name}" from "Venue"}
  Then %{I fill in "Group name" with "#{Faker::Lorem.words.join(' ')}"}
  Then %{I fill in "Description" with "#{Faker::Lorem.paragraphs.join("\n")}"}
end

Then /^the show should have one performance for the artist(?: "([^"]+)")? and the instrument(?: "([^"]+)")?$/ do |artist_name, instrument_name|
  the.show.should have(1).performance

  performance = the.show.performances.first

  if artist_name.present?
    performance.artist.name.should == artist_name
  else
    performance.artist.should == the.artist
  end

  if instrument_name.present?
    performance.instrument.name.should == instrument_name
  else
    performance.instrument.should == the.instrument
  end
end

Given /^the( last)? show has an additional video$/ do |last|
  Factory(:video, :show => (last ? Show.last : the.show))
end
