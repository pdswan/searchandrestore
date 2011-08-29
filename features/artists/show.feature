Feature: Artist Show
  As a user
  In order to learn more about an artist
  I should see detailed artist information on the artist show page

  Background:
    Given I am not logged in
    And there is a live artist

  Scenario: User sees artist information
    When I am on the detail page for the artist
    Then I should see identifying information for the artist

  @wip
  Scenario: User sees links to purchase artist's music
    Given the artist has buy links
    When I go to the detail page for the artist
    Then I should links to purchase the artist's music

  @wip
  Scenario: User sees links to the artist's upcoming shows
    Given the artist has upcoming shows
    When I go to the detail page for the artist
    Then I should see the artist's upcoming shows

  @pending
  Scenario: User sees artist's known associates
    Given the artist has known associates
    When I go to the detail page for the artist
    Then I should see the names of the artist's known associates with links to their pages

  @pending
  Scenario: Users sees videos featuring the artist
    Given there are videos featuring the artist
    
