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

  Scenario Outline: Non admin is redirected from new artist page
    Given I am <log in state>
    When I go to the new artist page
    Then I should be on the <redirected to> page

    Scenarios:
      | log in state  | redirected to |
      | logged in     | homepage      |
      | not logged in | login         |

  @wip
  Scenario: Admin creates new artist
    Given I am logged in as an admin user
    When I go to the new artist page
    And I fill in the new artist form with valid attributes
    And I press "Save"
    Then I should see the "name" of the artist
    And I should see the "bio" of the artist

  @wip
  Scenario Outline: Admin fails to create new artist
    Given I am logged in as an admin user
    When I go to the new artist page
    And I fill in the new artist form with valid attributes
    But I ommit "<ommitted>"
    And I press "Save"
    Then I should see "<expected error>"

    Scenarios:
      | ommitted | expected error      |
      | Name     | Name can't be blank |
      | Bio      | Bio can't be blank  |

