Feature: Edit About Section

  Background:
    Given I am logged in as an admin user

  Scenario: Admin adds about content
    When I go to the new admin about page
    And I fill in "Title" with "Something sweet"
    And I fill in "About" with "We're all about Jazz"
    And I press "Create About"
    Then I should see "About was successfully created"
    And I should see "We're all about Jazz"

