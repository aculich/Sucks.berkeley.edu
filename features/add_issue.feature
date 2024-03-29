Feature: Adding frustrating issues

  As a frustrated community member,
  So that I can voice my frustrations,
  I want to post issues onto the website for competent people to fix

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | Cs169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the home page

# Page 1
Scenario: see the correct information displayed on the front page
  Given I am on the Sucks.Berkeley.edu home page
  Then I should see "sucks!"
  Then I should see only a text box followed by the word "sucks!"

#Page 2
Scenario: enter an existing issue with multiple entries
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Airbears"
  And I click the submit arrow
  Then I should be on Page 2 for the issue "Airbears"
  And I should see "Are any of these your issue?"
  And I should see "SUBMIT NEW ISSUE"
  And I should see "Want to create a new issue for Airbears?"
  
Scenario: enter an existing issue with a single entry
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Cs169"
  And I click the submit arrow
  Then I should be on Page 2 for the issue "Cs169"
  And I should see "Is this your issue?"
  And I should see "SUBMIT NEW ISSUE"
  And I should see "Want to create a new issue for Cs169?"
  
Scenario: enter an issue that does not exist
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Cs170"
  And I click the submit arrow
  Then I should be on Page 2 for the issue "Cs170"
  And I should see "You're the first to have trouble with Cs170. Please create a new issue!"
  And I should see "SUBMIT NEW ISSUE"

Scenario: select an action from the list
  Given I am in Page 2 for issue "Airbears" with the correct information displayed
  And I follow "I can go on the internet"
  Then I should be in the page for the issue "Airbears"
  
Scenario: There's more than 1 issue on the list
  Given I am on Page 2 for the issue "Cs169"
  Then I should see "Cs169 sucks! Is this your issue?"

Scenario: enter a new issue
  Given I am in Page 2 for issue "Airbears" with the correct information displayed
  And I follow "SUBMIT NEW ISSUE"
  Then I should be on Page 3 for the issue "Airbears"

# Page 3
Scenario: enter information
  Given I am in Page 3 for issue "Cs169" with the correct information displayed
  And I fill in "want-text" with "I want to be able to log in for a longer period of time"
  And I fill in "so-text" with "So that I don't have to log in every time I check my email"
  And I click on the submit arrow

# Page 4
Scenario: visit issue information page
 Given I am in Page 4 for issue "Airbears" with the correct information displayed
 Then I should see "Request Pivotal Tracker Access"
