Feature: Saving a recipe

As a user
So that I can save a recipe and view them later
I want to be able to add recipes to a personal favorites list

Scenario: Saving a recipe
Given I have a user, 2 recipes
And I am on a recipe page
When I click on the "Save Recipe" button
Then that recipe should be added to my account's "Favorites" list of recipes
