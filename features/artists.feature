Feature: Artists Landing
  As a visitor
  In order to get a high level picture of the artists represented on the site
  I should see a filterable list of artists on the artists landing page

  Background:
    Given I am not logged in
    And there are 3 live artists

  Scenario: Visitor sees artists landing page
    When I go to the artists page
    Then I should see the artist names
    And I should see the artist image thumbs

  Scenario: Visitor filters artists by name
    Given there is a live artist with:
      | name | Phil Collins |
    When I go to the artists page
    And I fill in "Name" with "Phil Collins"
    And I press "search"
    Then I should only see the artist names for artists with:
      | name | Phil Collins |

  Scenario: Visitor filters artist by instrument
    When I go to the artists page
    And I select the instrument name from "Instrument"
    And I press "search"
    Then I should only see the artist names for artists with:
      | instrument_id | 3 |

  @wip
  Scenario: Visitor navigates to artist detail page
    When I go to the artists page
    And I click on an artist block
    Then I should be on the detail page for the artist


