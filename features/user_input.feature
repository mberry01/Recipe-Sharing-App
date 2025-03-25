Feature: Rating and commenting on recipes

As a user
So that I can leave feedback on other users’ recipes
I want to be able to rate recipes and post comments on them

Scenario: Rating a recipe
Given I am on a recipe’s page
And I scroll down to view the rating buttons
When I click on one of the 5 star-ratings
Then that rating should be applied to the recipe

Scenario: Commenting on a recipe
Given I am on a recipe’s page
And I scroll down to view the comments section
When I type out a comment in the section
And I click the “Add Comment” button
Then my comment should be visible on the recipe’s page
