Feature: About

  @done
  Scenario: User sees about tabs
    Given the following abouts exist:
      | title     | about                   |
      | About Us  | a fine group of fellows |
      | And Stuff | a bag full of things    |
    When I go to the about page
    Then I should see a tab with the title "About Us"
    And I should see a tab with the title "And Stuff"

  @done
  @javascript
  Scenario Outline: User sees about tab contents
    Given the following abouts exist:
      | title     | about                   |
      | About Us  | a fine group of fellows |
      | And Stuff | a bag full of things    |
    When I go to the about page
    And I click the "<tab>" tab
    Then I should see "<contents>"

    Examples:
      | tab       | contents                |
      | About Us  | a fine group of fellows |
      | And Stuff | a bag full of things    |


  Scenario: User sees press clippings on about page
    Given a press clipping exists
    When I go to the about page
    Then I should see the press clipping
