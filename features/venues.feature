Feature: Venues

  Scenario: Visitor sees venues
    Given a venue exists
    When I go to the venues page
    Then I should see the venue

  Scenario Outline: Visitor searches for venue
    Given a venue exists with a name of "CBGBs"
    When I go to the <start page>
    And I select "CBGBs" from "<select>"
    Then I press "search"
    Then I should be on the detail page for the venue

    Scenarios:
      | start page                | select |
      | venues page               | Name:  |
      | detail page for the venue | id     |
