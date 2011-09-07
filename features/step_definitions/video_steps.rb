Then /^I should see the video in the main video player$/ do
  within("#video_player_container") do
    Then %{the video should be loaded in the main video player}
    And  %{I should see a link to "#{url_for(the.video.show)}" with the text "#{the.video.show.group_name}"}
    And  %{I should see a link to "#{url_for(the.video.show.venue)}" with the text "#{the.video.show.venue.name}"}
    the.video.performances.each do |performance|
      And  %{I should see a link to "#{url_for(performance.artist)}" with the text "#{performance.artist.name} (#{performance.instrument.name})"}
    end
  end
end

Then /^the video should be loaded in the main video player$/ do
  sleep(2)
  within("#video_player_container") do
    page.should have_css("iframe=[src^='#{the.video.url.split('?').first}']")
  end
end

Then /^I should see a thumbnail for the video(?: within "([^"]+)")?$/ do |scope|
  within(scope) do
    page.should have_css("img[src='#{the.video.thumbnail.url(:tiny)}']")
    page.should have_css("a[href='#{the.video.url}'][data-video=true]")
  end
end
