Feature: Importing stories from UserVoice

    As an IT professional
    I want this list to be populated with issues from Uservoice
    So that frustrated users can select from pre-existing issues
    
    As a frustrated user
    So that I can see the existing information about an issue
    I want the Subject and Body information from Uservoice to be displayed on this page 

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the home page

Scenario: Pulling issues from UserVoice
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Airbears"
  And I click the submit arrow
  Then I should be on the End User Index Page for Airbears
  Then I should see "Airbears"
#  And I should see a list of stories that link back to UserVoice

#Scenario: Check to see issues from UserVoice are below PivotalTracker
#  Given I am on the End User Index Page for Airbears
#  Then I should see a list of issues that link back to UserVoice
#  And these issues should be below the issues from PivotalTracker
  
#Scenario: Check to see the subject and body information displayed
#  Given I am on the End User Index Page for Airbears
#  Then I should see a list of issues that link back to UserVoice
#  Then I should see the subject and body information from UserVoice displayed
