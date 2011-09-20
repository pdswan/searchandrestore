Feature: Venue details page

  Scenario: User sees venue details
    Given a venue exists
    When I go to the detail page for the venue
    Then show me the page
    Then I should see the venue details

  Scenario: User sees upcoming shows at the venue
    Given a venue with upcoming shows exists
    When I go to the detail page for the venue
    Then I should see the upcoming shows at the venue

  Scenario: User sees latest videos from the venue
    Given a venue with videos exists
    When I go to the detail page for the venue
    Then I should see the latest videos for the venue

  # search should use the scenario from venues.feature
