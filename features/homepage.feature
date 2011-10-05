Feature:

  Scenario: User should see tonight's top show picks
    Given a featured show exists
    When I go to the home page
    Then I should see the show

  Scenario: User sees featured video
    Given a video exists
    And the video is featured on the homepage
    When I go to the home page
    Then I should see a thumbnail for the video

  Scenario: User sees video description
    Given a video exists
    And the video is featured on the homepage with the description "Jaaaazzzzzz"
    When I go to the home page
    Then I should see "Jaaaazzzzzz"

  Scenario: User sees top news on homepage
    Given the following homepage exists:
      | exciting_news                    |
      | This is some damn exciting news! |
    When I go to the home page
    Then I should see "This is some damn exciting news!"

  Scenario: User sees about on homepage
    Given the following about exists:
      | about                       |
      | All about jazz, doggy |
    When I go to the home page
    Then I should see "All about jazz, doggy"
