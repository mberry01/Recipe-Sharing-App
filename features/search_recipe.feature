Feature: Searching and filtering

As a user
So that I can view specific recipes I want
I want to be able to find recipes using specific keywords and filters

Scenario: Searching by keywords
Given I have a user, 2 recipes
And I click on the search bar
When I type in keywords
And I click "Search" button
Then recipes using those keywords in their titles should appear

Scenario: Searching by filters
Given I have a user, 2 recipes
And I click on the "Filters" button
When I click on a filter
And I click "Apply Filter" button
Then recipes using those filters should appear
