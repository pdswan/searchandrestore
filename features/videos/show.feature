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

