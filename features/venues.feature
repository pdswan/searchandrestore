Feature: Venues

  @wip
  Scenario: Visitor sees venues
    Given a venue exists
    When I go to the venues page
    Then I should see the venue
