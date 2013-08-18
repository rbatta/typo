Feature: Article Merging
  As an admin
  In order to show two of the same blog articles
  I want to comment on both articles
  And I want to merge both articles

  Background:
  	Given the blog is set up
  	And I am logged in as admin

  Scenario: Successfully merge articles
    Given I am on some page
    And I click "Merge with This Article" button