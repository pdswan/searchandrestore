Feature: Link groups index

  Scenario: User sees link groups
    Given a link group with links exists
    When I go to the resources page
    Then I should see the link group name
    And I should see the links from the link group
