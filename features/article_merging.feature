Feature: Article Merging
  As an admin
  In order to show two of the same blog articles
  I want to comment on both articles
  And I want to merge both articles

  Background: users in database
  	Given the blog is created for the following users:
    | login  | password | email           | profile_id | name    | state    |
    | admin  | password | b@example.com   | 1          | bob     | active   |
    | user1  | password | c@example.com   | 2          | fred    | active   |

  Scenario: Non-admin logs in to post article
    When I log in as fred
    And I am on the new article page
    When I fill in "article_title" with "Cats"
    And I fill in "article__body_and_extended_editor" with "I <3 cats"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Cats"
    When I follow "Cats"
    Then I should see "I <3 cats"  
    
  Scenario: Non-admin cannot see Merge button
    When I log in as fred
    And I follow "All Articles"
    And show me the page
    And I follow "Edit"
    Then I should see "New article"
    And I should see "Publish"
    And the "article_title" field should contain "Cats"
    And I should not see "Merge with this Article"

  Scenario: Admin user can see Merge button
    When I log in as bob
    And I follow "All Articles"
    And show me the page
    And I follow "Cats"
    Then I should see "New article"
    And I should see "Merge Articles" button

  


  #Scenario: Not really an admin
  #  Given I am a user

  # create an article first
  # to be merged later


  # create user to be blog publisher


  # set up blog as non-admin
  # create an article about cats
  # non-admin can't see "Merge with this article" button
  # but path to it should be same as admin

  # set up a blog as non-admin (will become admin)
  # also create an article about cats
  # admin can see MwtA button

  # articles will have their own IDs