Feature: Feature shows

  Background:
    Given I am logged in as an admin user
    And 2 shows exist
    And I go to the admin shows page

  @javascript
  Scenario: Admin features shows
    When I click the featured checkboxes for the shows
    Then the shows should be featured shows

  @javascript
  Scenario: Admin marks shows as search and restore
    When I click the search and restore checkboxes for the shows
    Then the shows should be search and restore shows
