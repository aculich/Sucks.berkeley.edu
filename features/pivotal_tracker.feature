Feature: Importing stories from PivotalTracker

    As an IT professional
    I want the first items on the list to be stories that exist in Pivotal
    So that frustrated users can first see and upvote stories rather than adding new ones
    
    As a prospective developer looking for problems
    So that I can find the issues that are most important to the community
    I want to be able to see a listing of all issues added to Pivotal ranked by votes

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the home page

Scenario: Check stories to Pivotal Tracker
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Airbears"
  And I click the submit arrow
  Then I should be on the End User Index Page for Airbears
  Then I should see "Airbears"
#  And I should see a list of stories from Pivotal Tracker
  
#Scenario: Check to see issues from PivotalTracker are above UserVoice
#  Given I am on the End User Index Page for Airbears
#  And I should see a list of stories from Pivotal Tracker
#  And those stories should appear first on the list, before stories from UserVoice
  
#Scenario: Check to see that the issues are ranked by votes
#  Given I am on the End User Index Page for Airbears
#  Then I should see the list ranked by number of votes
