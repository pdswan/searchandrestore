Feature: Edit Homepage
  As an admin
  In order to customize the homepage
  I should be able to change the data that shows up there

  Background:
    Given I am logged in as an admin user

  Scenario: Admin edits exciting news
    When I go to the admin dashboard page
    And I follow "Homepage"
    And I fill in "Exciting news" with "This is something exciting"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see "This is something exciting"
