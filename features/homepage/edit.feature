Feature: Edit Homepage
  As an admin
  In order to customize the homepage
  I should be able to change the data that shows up there

  Background:
    Given I am logged in as an admin user
    And I go to the admin dashboard page

  Scenario: Admin edits exciting news
    Given I follow "Homepage"
    And I fill in "Exciting news" with "This is something exciting"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see "This is something exciting"

  Scenario: Admin adds more exciting news
    Given I follow "Homepage"
    Then show me the page
    And I fill in "Title" with "More exciting news"
    And I fill in "Text" with "Guess how exciting this is?"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And the homepage should have 1 blurb

  Scenario: Admin adds featured video
    Given a video exists with a title of "Surfing Dogs"
    And I follow "Homepage"
    And I choose the video as the featured homepage video
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see a link to "/admin/videos/1" with the text "Surfing Dogs"

  Scenario: Admin adds featured video description
    Given I follow "Homepage"
    And I fill in "Video description" with "This is the featured video"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see "This is the featured video"

  Scenario: Admin adds well hello there
    Given I follow "Homepage"
    And I fill in "Well hello there" with "Check it out suckas!"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see "Check it out suckas!"
