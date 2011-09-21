Then /^I fill in the new artist form with valid attributes$/ do
  Then %{I fill in "Name" with "#{Faker::Lorem.words.join(' ')}"}
  Then %{I fill in "Bio" with "#{Faker::Lorem.paragraphs.join("\n")}"}
end

Then /^I fill in the new buy link form with valid attributes$/ do
  Then %{I fill in "Title" with "#{Faker::Lorem.words.join(' ')}"}
  Then %{I fill in "Url" with "http://#{Faker::Internet.domain_name}"}
end

Then /^the artist should have 1 buy link$/ do
  the.artist.should have(1).buy_links
end

Then /^I should only see the artist names for artists with the instrument$/ do
  should, should_not = Artist.all.partition { |a| a.instrument == the.instrument }

  should.each do |artist|
    Then %{I should see "#{artist.name}"}
  end

  should_not.each do |artist|
    Then %{I should not see "#{artist.name}"}
  end
end

Then /^I should(?: only)? see the artist names( for artists with:)?$/ do |with_attrs, *args|
  attrs = args.first.try(:rows_hash) || { }

  attrs = attrs.inject({ }) do |attrs, (key, value)|
    value = value.to_i if value =~ /^[0-9]+$/
    attrs.merge(key => value)
  end if attrs.present?

  Artist.all.each do |artist|
    if attrs.blank? || (attrs == artist.attributes.slice(*attrs.keys))
      Then %{I should see "#{artist.name}"}
    else
      Then %{I should not see "#{artist.name}"}
    end
  end
end

Then /^I should see the artist image thumbs$/ do
  Artist.all.each do |artist|
    page.should have_css("img[src='#{artist.image.thumb.url}']")
  end
end

Then /^I click on an artist block$/ do
  Then %{I follow "#{the.artist.name}"}
end

Then /^I should see identifying information for the artist$/ do
  within "#info" do
    Then %{I should see "#{the.artist.name}"}
    Then %{I should see "#{the.artist.instrument.name}"}
    
    the.artist.bio.split("\n").each do |paragraph|
      Then %{I should see "#{paragraph}"}
    end

    page.should have_css("img[src='#{the.artist.image.url(:thumb)}']")
  end
end

Then /^I should see links to purchase the artist's music$/ do
  raise "There are no buy links" unless the.artist.buy_links.present?

  the.artist.buy_links.each do |link|
    Then %{I should see a link to "#{link.url}" with the text "#{link.title}"}
  end
end

Then /^I should see the artist's upcoming shows$/ do
  raise "There are no upcoming shows" unless the.artist.upcoming_shows.present?

  the.artist.upcoming_shows.each do |show|
    Then %{I should see a link to "#{url_for(show)}" with the text "#{show.group_name}"}
    Then %{I should see a link to "#{url_for(show.venue)}" with the text "#{show.venue.name}"}
  end
end

Then /^I should see the names of the artist's known associates with links to their pages$/ do
  raise "User has no known associates" unless the.artist.associated_artists.present?

  the.artist.associated_artists.each do |user|
    Then %{I should see a link to "#{url_for(user)}" with the text "#{user.name}"}
  end
end

Given /^there is an artist who has performed in 2 shows and the shows both have videos$/ do
  Given %{a live artist exists}
  And   %{2 shows exist}

  And   %{the following performances exist:}, table(%{
    | show_id | artist_id |
    | 1       | 1         |
    | 2       | 1         |
  })

  And   %{the following videos exist:}, table(%{
    | show_id |
    | 1       |
    | 2       |
  })
end

