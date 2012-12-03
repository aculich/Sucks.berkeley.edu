Feature: Implement Comments Panel for a specific issue between users / developers

  As a frustrated user,
  So that I can comment and contribute to an issue,
  I want to see a comments panel

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on Page 4 for the issue "Airbears"

Scenario: see comment panel displayed
  Given I am in Page 4 for issue "Airbears" with the correct information displayed
  Then I should see "Discussion"
  
Scenario: add a comment as a normal user
  Given I am in Page 4 for issue "Airbears" with the correct information displayed
  Then I should see "Discussion"
  And I submit a comment with name "Tester" and comment "Hello"
  And I click the submit arrow
  Then I should see my comment displayed with name "Tester" and comment "Hello"
