Feature: Shows

  Background:
    Given I am not logged in

  Scenario: Visitor sees todays shows by default
    Given a show with performances exists
    And a show with performances exists with a when of "2010-10-31"
    When I go to the shows page
    Then I should see the shows happening today
    But I should not see the shows not happening today

  @javascript
  Scenario: Visitor users calendar to search for shows by date
    Given the date is "9/10/2011"
    And a show with performances exists with a when of "2011-09-09"
    When I go to the shows page
    And I choose "2011-09-09" from the datepicker
    And I press "search"
    Then I should see the shows with a when of "2011-09-09"
    But I should not see the shows with a when of "2011-09-10"

  Scenario: Visitor sees upcoming search and restore shows
    Given a show exists
    And a search and restore show exists
    When I go to the shows page
    Then I should see the upcoming search and restore shows section

  Scenario: Visitor searches for shows by artist
    Given a show with performances exists
    And the following live artist with upcoming shows exists:
      | name     |
      | Weird Al |
    When I go to the shows page
    And I fill in "Artist" with "Weird Al"
    And I press "search"
    Then I should only see the shows for the artist with name "Weird Al"

  Scenario: Visitor searches for show by venue
    Given a venue exists with a name of "Bowery Ballroom"
    And a show exists with a venue id of "1"
    And a show exists
    When I go to the shows page
    And I select "Bowery Ballroom" from "Venue"
    And I press "search"
    Then I should only see the shows for the venue with name "Bowery Ballroom"

