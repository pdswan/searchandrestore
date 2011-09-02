Then /^I should see the video in the main video player$/ do
  within("#video-player-container") do
    Then %{the video should be loaded in the main video player}
    And  %{I should see a link to "#{url_for(the.video.show)}" with the text "#{the.video.show.group_name}"}
    And  %{I should see a link to "#{url_for(the.video.show.venue)}" with the text "#{the.video.show.venue.name}"}
    the.video.performances.each do |performance|
      And  %{I should see a link to "#{url_for(performance.artist)}" with the text "#{performance.artist.name} (#{performance.instrument.name})"}
    end
  end
end

Then /^the video should be loaded in the main video player$/ do
  page.should have_css("iframe#video-player[src^='#{the.video.url}']")
end
