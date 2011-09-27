Feature:

  Scenario: User should see tonight's top show picks
    Given a featured show exists
    When I go to the home page
    Then I should see the show

