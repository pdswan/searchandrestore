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

Then /^I should see a thumbnail for the video(?: within "([^"]+)")?$/ do |scope|
  within(scope) do
    page.should have_css("img[src='#{the.video.thumbnail.url(:tiny)}']")
    page.should have_css("a[href='#{the.video.url}'][data-video]")
  end
end
