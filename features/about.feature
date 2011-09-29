Feature: About

  Scenario: User sees about on about page
    Given the following about exists:
      | about |
      | a fine group of fellows |
    When I go to the about page
    Then I should see "a fine group of fellows"

  Scenario: User sees press clippings on about page
    Given a press clipping exists
    When I go to the about page
    Then I should see the press clipping
