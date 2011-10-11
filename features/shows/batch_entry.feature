Feature: Batch entry of shows
  As an admin
  In order to quickly input shows with shared data
  I would should be able to start a batch entry session which 
  automatically populates the new show form which data I input

  Background:
    Given I am logged in as an admin user
    And a venue exists
    And an artist exists
    And an instrument exists

  Scenario: Admin creates batch entry session
    Given I go to the admin shows page
    And I create a batch entry session
    Then I should be on the new admin show page
    And the fields should be populated with the data from the batch entry session

  Scenario: Admin stops batch entry session
    Given I have created a batch entry session
    And I go to the admin shows page
    When I follow "Stop batch entry"
    And I go to the new admin show page
    Then the fields should not be populated with any data
