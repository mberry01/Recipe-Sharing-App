Feature: Posting a recipe
  As a registered user
  I want to create a new recipe
  So that it can be shared with others

  Scenario: Posting recipe
    Given a user exists with email "user1@example.com" and password "user1password"
    And I log in as "user1@example.com" with password "user1password"
    And I go to the recipes page
    When I click on "Create Recipe" button
    And add information such as description, ingredients, and title
    And click on "Post Recipe" button
    Then the recipe using my information should be posted and viewable to other users