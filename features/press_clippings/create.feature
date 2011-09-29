Feature: create presss clippings

  Scenario: Admin creates press clipping
    Given I am logged in as an admin user
    When I go to the new admin press clipping page
    And I fill in the new press clipping form with valid attributes
    And I press "Create Press clipping"
    Then I should see "Press clipping was successfully created"
