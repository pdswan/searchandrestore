Feature: create presss clippings

  Scenario: Admin creates press clipping
    Given I am logged in as an admin user
    When I go to the new admin press clipping page
    And I fill in the new press clipping form with valid attributes
    And I press "Create Press clipping"
    Then I should see "Press clipping was successfully created"

  Scenario Outline: Admin fails to create press clipping
    Given I am logged in as an admin user
    When I go to the new admin press clipping page
    And I fill in the new press clipping form with valid attributes
    But I ommit "<ommitted>"
    And I press "Create Press clipping"
    Then I should see "<expected error>" within "<container>"

    Scenarios:
      | ommitted | expected error | container                    |
      | Source   | can't be blank | #press_clipping_source_input |
      | Author   | can't be blank | #press_clipping_author_input |

