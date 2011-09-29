Feature: Edit About Section

  Background:
    Given I am logged in as an admin user

  Scenario: Admin adds about content
    When I go to the admin dashboard page
    And I follow "About"
    And I fill in "About" with "We're all about Jazz"
    And I press "Update About"
    Then I should see "About was successfully updated"
    And I should see "We're all about Jazz"

