Feature: Video details feature

  Scenario: User sees video in the video player
    Given a video exists
    When I go to the detail page for the video
    Then I should see the video in the main video player

  Scenario: User sees other videos from the same show in related videos section
    Given a video exists
    And a video exists with a show id of "1"
    When I go to the detail page for the video
    Then I should see thumbnails for the videos from the show in the related videos section

  Scenario: User sees thumbnails for videos from other shows
    Given a video exists
    And 3 videos exist
    When I go to the detail page for the video
    Then I should see thumbnails for the videos within "#more_videos"

  Scenario: User sees one video per show for all shows from the venue
    Given the following venue with videos exists:
      | name           |
      | The Brown Note |
    And a venue with videos exists
    When I go to the videos page
    And I select "The Brown Note" from "Venue"
    And I press "search"
    And I click the thumbnail for video "1"
    Then I should see a thumbnail for the first video within "#more_videos"
    But I should not see a thumbnail for the last video
