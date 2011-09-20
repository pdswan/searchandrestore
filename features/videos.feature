Feature: Videos index
  In order to have an overview of the latest videos
  As a visitor to search and restore
  I should see the latest videos on the video index page

  Scenario: User sees videos
    Given a show exists
    And 2 videos exist with a show id of "1"
    When I go to the videos page
    Then I should see a thumbnail for the first video which links to the video detail page

  Scenario: User searches for videos by artist
    Given the following live artist with videos exists:
      | name        |
      | Miles Davis |
    And a video exists
    When I go to the videos page
    And I select "Miles Davis" from "Artist"
    And I press "search"
    Then show me the page
    Then I should see a thumbnail for the first video which links to the video detail page
    But I should not see a thumbnail for the last video

