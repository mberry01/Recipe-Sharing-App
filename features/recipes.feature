Feature: Adding recipes

As a user
So that I can make recipes available to other users
I want to be able to post recipes to the app

Scenario: Posting recipe
Given I click on the "Post Recipe" button
When I add my information such as pictures, instructions, and ingredients
And the information meets the minimum requirements for posting
Then the recipe using my information should be posted and viewable to other users
