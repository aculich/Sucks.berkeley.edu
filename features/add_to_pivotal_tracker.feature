Feature: Adding stories to PivotalTracker

  As an IT professional
  I want the story to be added to Pivotal tracker on it’s 3rd upvote
  So the most popular stories get added to Pivotal first

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 9	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | Kevin Yao               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the home page

Scenario: Add issues to Pivotal Tracker when the issue hits 3 upvotes
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Airbears"
  And I click the submit arrow
  Then I should be on the End User Index Page for Airbears
  Then I should see "Airbears"
  And the issue "Airbears" should have 2 votes
  Then I click on +1
  And I should be on the Specfic Issue Page for Airbears
  Then I go back to the End User Index Page for Airbears
  And I should see Airbears at the top of the list, before UserVoice issues
  
Scenario: Don't add issues to Pivotal Tracker when the issue is less than 3 votes
  Given I am on the End User Index Page for Kevin Yao
  Then I should see "Kevin Yao"
  And the issue "Kevin Yao" should have 1 vote
  Then I click on +1
  And I should be on the Specfic Issue Page for Kevin Yao
  Then I go back to the End User Index Page for Kevin Yao
  And I should see Kevin Yao in the same place he was last time I checked
  
Scenario: Don't re-add issues to Pivotal Tracker when the issue already had more than 3 votes
  Given I am on the End User Index Page for Perimeter Buses
  And the issue "Perimeter Buses" should have 9 votes
  Then I click on +1
  And I should be on the Specfic Issue Page for Perimeter Buses
  Then I go back to the End User Index Page for Perimeter Buses
  And I should see Perimeter Buses in the same place he was last time I checked