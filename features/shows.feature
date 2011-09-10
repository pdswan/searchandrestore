Feature: Shows

  Background:
    Given I am not logged in

  Scenario: Visitor sees todays shows by default
    Given a show with performances exists
    Given a show with performances exists with a when of "2010-10-31"
    When I go to the shows page
    Then I should see the shows happening today
    But I should not see the shows not happening today
