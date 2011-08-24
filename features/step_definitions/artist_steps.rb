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

Then /^I should see the artist names$/ do
  Artist.all.each do |artist|
    Then %{I should see "#{artist.name}"}
  end
end

Then /^I should see the artist image thumbs$/ do
  Artist.all.each do |artist|
    page.should have_css("img[src='#{artist.image.thumb.url}']")
  end
end

