Feature: Artist Show
  As a user
  In order to learn more about an artist
  I should see detailed artist information on the artist show page

  Background:
    Given I am not logged in

  Scenario: User sees artist information
    Given there is a live artist
    When I am on the detail page for the artist
    Then I should see identifying information for the artist

  Scenario: User sees links to purchase artist's music
    Given there is a live artist with buy links
    When I go to the detail page for the artist
    Then I should see links to purchase the artist's music

  Scenario: User sees links to the artist's upcoming shows
    Given there is a live artist with upcoming shows
    When I go to the detail page for the artist
    Then I should see the artist's upcoming shows

  Scenario: User sees artist's known associates
    Given there is a live artist with known associates
    When I go to the detail page for the artist
    Then I should see the names of the artist's known associates with links to their pages

  @wip
  Scenario: Users sees videos featuring the artist
    Given there is a live artist with videos
    When I go to the detail page for the artist
    Then I should see the latest video for the artist in the main video player
    
