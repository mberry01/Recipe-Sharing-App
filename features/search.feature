Feature: Searching and filtering

As a user
So that I can view specific recipes I want
I want to be able to find recipes using specific keywords and filters

Scenario: Searching by keywords
Given I click on the search bar
When I type in keywords
And I press Enter
Then recipes using those keywords in their titles should appear

Scenario: Searching by filters
Given I click on the filter tab
When I click on certain filters
And I press Enter to apply them
Then recipes using those filters should appear
