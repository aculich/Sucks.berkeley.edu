Feature: Implement Comments Panel for a specific issue between users / developers

  As a frustrated user,
  So that I can comment and contribute to an issue,
  I want to see a comments panel

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the developer page

Scenario: see comment panel displayed
  Given I am in Page 2 for issue "Airbears" with the correct information displayed
  And I see the story "As a user of Airbears So that I can watch hulu I want to get internet access"
  Then I should see Discussion panel at the bottom
  
Scenario: add a comment
  Given I am in Page 2 for issue "Airbears" with the correct information displayed
  And I see the story "As a user of Airbears So that I can watch hulu I want to get internet access"
  Then I should see Discussion panel at the bottom
  And I fill in the panel with "blah"
  And I press submit
  Then I should see my comment displayed
