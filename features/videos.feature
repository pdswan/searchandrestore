Feature: Videos index
  In order to have an overview of the latest videos
  As a visitor to search and restore
  I should see the latest videos on the video index page

  Scenario: User sees videos
    Given a show exists
    And 2 videos exist with a show id of "1"
    When I go to the videos page
    Then I should see a thumbnail for the first video which links to the video detail page

