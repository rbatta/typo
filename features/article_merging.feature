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

    When I log in as fred
    And I am on the new article page
    And I post an article about cats
    And I follow "Log out"
    When I log in as bob
    And I am on the new article page
    And I post an article about dogs
    And I follow "Log out"
    When I am on the home page
    And I follow "Dogs"
    And I post a comment about dogs
    And I press "comment"

  Scenario: Non-admin shouldn't see Merge Articles
    Given I log in as fred
    And I follow "All Articles"
    And I follow "Cats"
    Then I should see "New article"
    And the "article_title" field should contain "Cats"
    And I should not see "Merge Articles"  

  Scenario: Admin user can see Merge Articles
    When I log in as bob
    And I follow "All Articles"
    And I follow "Dogs"
    Then I should see "New article"
    And I should see "Merge Articles"

  Scenario: Admin user merges articles and see comments
    When I log in as bob
    And I follow "All Articles"
    And I follow "Cats"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    And I am on the home page
    And I follow "Cats"
    Then I should see "I <3 cats!"
    And I should see "I <3 dogs!"
    And I should see "asdf" 

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