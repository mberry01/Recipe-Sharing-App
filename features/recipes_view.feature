Feature: Viewing recipes

As a user
So that I can follow and use recipes on the app
I want to be able to go to a recipe's page and view all its information

Scenario: Viewing all recipes
Given there are posted recipes
When I go to the home page
Then I should be able to see all the recipes

Scenario: Viewing one recipe
Given there are posted recipes
And I want to view a specific recipe
When I click on the recipe
Then I should be taken to that recipe's page
And I should be able to view all its information
