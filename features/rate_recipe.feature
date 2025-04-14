Feature: Rating and commenting on recipes

As a user
So that I can leave feedback on other users' recipes
I want to be able to rate recipes and post comments on them

Scenario: Rating a recipe
  Given I am on a recipe page
  When I fill in "Rating" with "4"
  And I press "Submit Rating"
  Then that rating should be applied to the recipe
  
Scenario: Commenting on a recipe
Given I have a user, 2 recipes
And I am on a recipe page
When I type out a comment in the section
And I click the "Add Comment" button
Then my comment should be visible on the recipe's page
