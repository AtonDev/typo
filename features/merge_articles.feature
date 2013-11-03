Feature: Merge Articles
	As an Admin
	I want to be able to merge articles on the same topic
	To remove articles on a duplicate topic

Background: User and Articles have been added to database

	Given the following users exist:
	| login         | password    | email   | profile_id  | name    | state   |
	| admin  		| a12345      | a@a.com | 1           | alonso  | active  |
	| publisher   	| p12345      | p@p.com | 2           | pedro   | active  |
	| contributor 	| c12345      | c@c.com | 3           | carin   | active  |

	Given the following articles exist:
	| id  | title             | author         | body              | allow_comments  | published_at        |
	| 1   | Surfing elephant  | admin          | Article 1 Content | true            | 2013-11-01 01:01:01 |
	| 2   | Surfing giraffe   | blog_publisher | Article 2 Content | true            | 2013-11-02 02:02:02 |

	Scenario: A non Admin cannot merge articles
		Given I am not an admin
	    When I am on the edit article page
	    Then I should not see the "merge articles" form

	Scenario: Merged articles should contain content of both
		Given I am logged in as admin
	    Then I should see "Surfing elephant"
	    When I follow "Surfing elephant"
	    When I fill in "article_id_merge" with "2"
	    And I press "Merge"
	    Then I should see "Article Content 1"
	    And I should see "Article Content 2"

	Scenario: Merged articles should have one author (either one)
		Given I am logged in as admin
	    Given I am on the edit article page
	    Then I should see "author 1"
	    And I should not see "author 2"

	Scenario: Merged articles should have comments from both
		Given I am logged in as admin
	    Then I should see "Surfing elephant"
	    When I follow "Surfing elephant"
	    Then I should see "comment body 1"
	    And I should see "comment body 2"


	Scenario: Merged articles should have one title (either one)
		Given I am logged in as admin
	    Then I should see "Surfing elephant"
	    When I follow "Surfing elephant"
	    Then I should see "title 1"
	    And I should not see "title 2"




