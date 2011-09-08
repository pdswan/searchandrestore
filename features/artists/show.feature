Feature: Artist Show
  As a user
  In order to learn more about an artist
  I should see detailed artist information on the artist show page

  Background:
    Given I am not logged in

  Scenario: User sees artist information
    Given a live artist exists
    When I am on the detail page for the artist
    Then I should see identifying information for the artist

  Scenario: User sees links to purchase artist's music
    Given a live artist with buy links exists
    When I go to the detail page for the artist
    Then I should see links to purchase the artist's music

  Scenario: User sees links to the artist's upcoming shows
    Given a live artist with upcoming shows exists
    When I go to the detail page for the artist
    Then I should see the artist's upcoming shows

  Scenario: User sees artist's known associates
    Given a live artist with known associates exists
    When I go to the detail page for the artist
    Then I should see the names of the artist's known associates with links to their pages

  Scenario: User sees videos from latest show in main video player
    Given a live artist with upcoming shows exists
    And 2 videos exist with a show id of "1"
    When I go to the detail page for the artist
    Then I should see the first video from the show in the main video player
    And I should see thumbnails for the videos from the show in the related videos section

  @javascript
  Scenario: User chooses other video from the latest video's show
    Given a live artist with upcoming shows exists
    And 2 videos exist with a show id of "1"
    When I go to the detail page for the artist
    And I click the thumbnail for the last video in the related videos section
    Then I should see the last video from the show in the main video player
