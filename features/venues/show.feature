Feature: Venue details page

  Scenario: User sees venue details
    Given a venue exists
    When I go to the detail page for the venue
    Then show me the page
    Then I should see the venue details

  @wip
  Scenario: User sees upcoming shows at the venue
    Given a venue with upcoming shows exists
    When I go to the detail page for the venue
    Then I should see the upcoming shows at the venue

  @wip
  Scenario: User sees latest videos from the venue
    Given a venue with videos exists
    When I go to the detail page for the venue
    Then I should see the most recent videos

  # search should use the scenario from venues.feature
