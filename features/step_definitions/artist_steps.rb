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
