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

