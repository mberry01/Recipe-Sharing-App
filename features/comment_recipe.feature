Feature: Commenting on recipes

As a user
So that I can leave feedback on other users' recipes
I want to be able to post comments on them
  
Scenario: Commenting on a recipe
Given I have a user, 2 recipes
And I am on a recipe page
When I type out a comment in the section
And I click the "Add Comment" button
Then my comment should be visible on the recipe's page
