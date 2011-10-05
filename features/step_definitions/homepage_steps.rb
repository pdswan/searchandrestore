Then /^I choose the video as the featured homepage video$/ do
  Then %{show me the page}
  Then %{I select "#{the.video.title}" from "Video"}
end
