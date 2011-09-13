Feature: Venues

  Scenario: Visitor sees venues
    Given a venue exists
    When I go to the venues page
    Then I should see the venue

  Scenario: Visitor searches for venue
    Given a venue exists with a name of "CBGBs"
    When I go to the venues page
    And I select "CBGBs" from "Name:"
    Then I press "search"
    Then I should be on the detail page for the venue
