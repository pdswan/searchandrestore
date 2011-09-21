Feature: Videos index
  In order to have an overview of the latest videos
  As a visitor to search and restore
  I should see the latest videos on the video index page

  Scenario: User sees videos
    Given a show exists
    And 2 videos exist with a show id of "1"
    When I go to the videos page
    Then I should see a thumbnail for the first video

  Scenario Outline: User searches for videos by artist
    Given the following live artist with videos exists:
      | name        |
      | Miles Davis |
    And a video exists
    When I go to the <page>
    And I select "Miles Davis" from "Artist"
    And I press "search"
    Then I should see a thumbnail for the first video
    But I should not see a thumbnail for the last video

    Scenarios:
      | page                      |
      | videos page               |
      | detail page for the video |

  Scenario Outline: User searches for videos by venue
    Given the following venue with videos exists:
      | name           |
      | The Brown Note |
    And a video exists
    When I go to the <page>
    And I select "The Brown Note" from "Venue"
    And I press "search"
    Then I should see a thumbnail for the first video
    But I should not see a thumbnail for the last video

    Scenarios:
      | page                      |
      | videos page               |
      | detail page for the video |
