Feature: User login
  As a registered user
  I want to log in
  So I can access my dashboard

  Background:
    Given a user exists with email "jan@example.com" and password "secret123"

  Scenario: Logging in with valid credentials
    When I visit the login page
    And I fill in "Email" with "jan@example.com"
    And I fill in "Password" with "secret123"
    And I press "Log In"
    Then I should be on the main page
    And I should see "Welcome"

  Scenario: Logging in with invalid credentials
    When I visit the login page
    And I fill in "Email" with "jan@example.com"
    And I fill in "Password" with "wrongpass"
    And I press "Log In"
    Then I should be on the login page
    And I should see "Try another email address or password."
