Feature: Create and access account

As a user
So that I can have recipes and information saved on the app
I want to be able to create and sign into an account

Scenario: Creating an account
Given I am on the “Sign Up” page
When I input my information for username, e-mail, and password
And I click the “Sign Up” button
Then my account should be created using that information

Scenario: Signing into account
Given I am on the “Log In” page
When I input my username and password
And I click the “Log In” button
Then I should be logged into my account
