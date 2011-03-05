Feature: Artists
  As a visitor
  In order to learn about the new york jazz community
  I should be able to read about artists

  Scenario: Visitor sees artists
    Given I am not logged in
    And there are artists
    When I go to the artists page
    Then I should see the artists

  Scenario: Visitor sees artist details
    Given I am not logged in
    And there are artists
    When I go to the artists page
    Then I can click on an artist
    And I should see the artist details

  Scenario: Visitor navigates to related artists
    Given I am not logged in
    And there are artists
    And they are related to one another
    When I go to an artist detail page
    Then I should see the related artists
