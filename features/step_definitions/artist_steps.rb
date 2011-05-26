Then /^I fill in the new artist form with valid attributes$/ do
  Then %{I fill in "Name" with "#{Faker::Lorem.words.join(' ')}"}
  Then %{I fill in "Bio" with "#{Faker::Lorem.paragraphs.join("\n")}"}
end
