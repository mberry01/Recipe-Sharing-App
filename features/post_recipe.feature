Feature: Adding recipes

As a user
So that I can make recipes be available to other users
I want to be able to post recipes to the app

Scenario: posting recipe
Given I have a user, 2 recipes
When I click on "Create Recipe" button
And add information such as description, ingredients, and title
And click on "Post Recipe" button
Then the recipe using my information should be posted and viewable to other users
