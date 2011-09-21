Feature: Video details feature

  Scenario: User sees video in the video player
    Given a video exists
    When I go to the detail page for the video
    Then I should see the video in the main video player
