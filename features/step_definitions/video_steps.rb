Then /^(.+) in the main video player$/ do |step|
  within("#video_player_container") do
    Then "#{step}"
  end
end

Then /^I should see the video$/ do
  Then %{the video should be loaded}

  And  %{I should see a link to "#{url_for(the.video.show)}"}
  And  %{I should see a link to "#{url_for(the.video.show.venue)}"}

  the.video.performances.each do |performance|
    And  %{I should see a link to "#{url_for(performance.artist)}" with the text "#{performance.artist.name} (#{performance.instrument.name})"}
  end
end

Then /^the video should be loaded$/ do
  sleep(2)
  page.should have_css("iframe[src^='#{the.video.url.split('?').first}']")
end

Then /^I should see a thumbnail for the first video( within .*)?$/ do |within|
  the.video = Video.first
  Then %{I should see a thumbnail for the video#{within}}
end

Then /^I should see thumbnails for the videos( within .*)?$/ do |within|
  Video.order_by_show_date.group_by_show.all.each do |video|
    the.video = video
    Then %{I should see a thumbnail for the video#{within}}
  end
end

Then /^I should not see a thumbnail for the last video$/ do
  the.video = Video.last
  page.should have_no_css("a[data-video='#{the.video.id}']")
end

Then /^I should see a thumbnail for the video(?: within "([^"]+)")?$/ do |scope|
  within(scope || 'body') do
    page.should have_css("img[src='#{the.video.thumbnail.url(:tiny)}']")
    page.should have_css("a[href*='#{video_path(the.video)}'][data-video='#{the.video.id}']")
  end
end

Then /^I should see thumbnails for the videos from the show in the related videos section$/ do
  the.show.videos.each do |video|
    the.video = video
    Then %{I should see a thumbnail for the video within "#related_videos"}
  end
end

Then /^I should see thumbnails for the videos from the last show in the related videos section$/ do
  Show.last.videos.each do |video|
    the.video = video
    Then %{I should see a thumbnail for the video within "#related_videos"}
  end
end

Then /^I should see the thumbnail for the first video from the last show in the more videos section$/ do
  the.video = the.artist.shows.last.videos.first
  Then %{I should see a thumbnail for the video within "#more_videos"}
end

Then /^I should see the first video from the show$/ do
  the.video = the.show.videos.first
  Then %{I should see the video}
end

And /^I click the thumbnail for(?: the)? video(?: "(.+)?")?$/ do |video_id|
  the.video = Video.find(video_id) if video_id.present?
  page.find("a[data-video='#{the.video.id}']").click
end

And /^I click the thumbnail for the last video in the related videos section$/ do
  within("#related_videos > li:last-child") do
    page.find("a[data-video]").click
  end
end

And /^I click the thumbnail for the first video from the last show in the more videos section$/ do
  within("#more_videos > li:last-child") do
    page.find("a[data-video]").click
  end
end

Then /^I should see the first video from the last show$/ do
  the.video = the.artist.shows.last.videos.first
  Then %{I should see the video}
end

Then /^I should see the last video from the show$/ do
  the.video = the.show.videos.last
  Then %{I should see the video}
end

