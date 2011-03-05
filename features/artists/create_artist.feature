Feature: Create Artist
  As an admin
  In order to present information about an artist
  I should be able to create an artist

  Scenario: Admin sees new artist page
    Given I am logged in as an admin user
    When I go to the artists page
    And I follow "Add an artist"
    Then I should be on the new artist page

  Scenario: Non admin does not see add artist link on artists page
    Given I am not logged in
    When I go to the artists page
    Then I should not see "Add an artist"

  Scenario: Non admin is redirected from new artist page
    Given I am not logged in
    When I go to the new artist page
    Then I should be redirected to the login in page

  Scenario: Admin creates new artist
    Given I am logged in as an admin user
    When I go to the new artist page
    And I fill in the new artist form with valid attributes
    Then I can create an artist
    And I should see the artist

