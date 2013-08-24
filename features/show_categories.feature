Feature: Show Categories Page
  As an admin
  In order to show the categories feature
  I want to create and edit categories
 
 Scenario: Show the Categories feature
 	Given the blog is set up
 	And I am logged into the admin panel
 	And I follow "Categories"
 	Then I should see "Categories"
