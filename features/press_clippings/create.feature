Feature: create presss clippings

  Scenario: Admin creates press clipping
    Given I am logged in as an admin user
    When I go to the new admin press clipping page
    And I fill in the new press clipping form with valid attributes
    And I press "Create Press clipping"
    Then I should see "Press clipping was successfully created"

  Scenario: Admin fails to create press clipping
    Given I am logged in as an admin user
    When I go to the new admin press clipping page
    And I press "Create Press clipping"
    Then I should see "can't be blank" within "#press_clipping_source_input"
    And I should see "can't be blank" within "#press_clipping_author_input"
    And I should see "can't be blank" within "#press_clipping_date_input"
    And I should see "can't be blank and is invalid" within "#press_clipping_link_attributes_url_input"

