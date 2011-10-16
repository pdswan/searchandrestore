Feature: Create link group

  Background:
    Given I am logged in as an admin user
    And I go to the new admin link group page

  Scenario: Admin creates link group with links
    Given I create a link group with links
    Then I should see "Link group was successfully created"
