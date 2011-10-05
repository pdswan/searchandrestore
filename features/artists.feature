Feature: Artists Landing
  As a visitor
  In order to get a high level picture of the artists represented on the site
  I should see a filterable list of artists on the artists landing page

  Background:
    Given I am not logged in
    And 3 live artists exist

  Scenario: Visitor sees artists landing page
    When I go to the artists page
    Then I should see the artist names
    And I should see the artist image thumbs

  Scenario Outline: Visitor filters artists by name
    Given the following live artist exists:
      | name         |
      | Phil Collins |
    When I go to the <page>
    And I fill in "Name" with "<search>"
    And I press "search"
    Then I should only see the artist names for artists with:
      | name | Phil Collins |

    Scenarios:
      | page                     | search |
      | artists page             | Phil   |
      | artists page             | Col    |
      | detail page for artist 1 | Phil   |
      | detail page for artist 1 | Col    |

  Scenario Outline: Visitor filters artist by instrument
    When I go to the artists page
    And I select the instrument name from "Instrument"
    And I press "search"
    Then I should only see the artist names for artists with the instrument

    Scenarios:
      | page                     | id |
      | artists page             | 3  |
      | detail page for artist 1 | 6  |

  Scenario: Visitor navigates to artist detail page
    When I go to the artists page
    And I click on an artist block
    Then I should be on the detail page for the artist


