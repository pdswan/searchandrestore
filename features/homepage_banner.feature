Feature: Homepage banner

  Scenario: A homepage banner exists
    Given a homepage banner exists
    When I go to the home page
    Then I should see the homepage banner

  Scenario: A homepage banner with a url exists
    Given a homepage banner with a url exists
    When I go to the home page
    Then I should see the homepage banner
      And the homepage banner should link to it's url
