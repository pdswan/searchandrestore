Then /^I choose the video as the featured homepage video$/ do
  Then %{I select "#{the.video.title}" from "Video"}
end

Given /^the video is featured on the homepage$/ do
  the.homepage = Homepage.last || Homepage.create
  the.homepage.update_attribute(:video_id, the.video.id)
end

Given /^the video is featured on the homepage with the description "([^"]+)"$/ do |desc|
  Given %{the video is featured on the homepage}
  the.homepage.update_attribute(:video_description, desc)
end

Given /^the homepage has a blurb$/ do
  the.homepage.blurbs.create!(:title => 'Hey Chauncey!',
                              :text  => 'This is some text!')
end

Then /^I should see the title and text of the blurb$/ do
  page.should have_content(the.blurb.title)
  page.should have_content(the.blurb.text)
end

Then /^the homepage should have ([0-9]+) blurbs?$/ do |count|
  the.homepage.should have(count.to_i).blurbs
end
