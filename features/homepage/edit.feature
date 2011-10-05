Feature: Edit Homepage
  As an admin
  In order to customize the homepage
  I should be able to change the data that shows up there

  Background:
    Given I am logged in as an admin user

  Scenario: Admin edits exciting news
    When I go to the admin dashboard page
    And I follow "Homepage"
    And I fill in "Exciting news" with "This is something exciting"
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see "This is something exciting"

  Scenario: Admin adds featured video
    Given a video exists with a title of "Surfing Dogs"
    When I go to the admin dashboard page
    And I follow "Homepage"
    And I choose the video as the featured homepage video
    And I press "Update Homepage"
    Then I should see "Homepage was successfully updated"
    And I should see a link to "/admin/videos/1" with the text "Surfing Dogs"
