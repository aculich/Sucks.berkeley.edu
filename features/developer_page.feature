Feature: Developer page has "Projects" and a list of issues under that project

  As a Prospective Developer,
  So that I can see what people have problems with,
  I want to see a list of projects

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | link_to_uservoice	 | date_entered	    | votes	 | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com   	     | 25-Nov-1992	    | 3	     | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com   	     | 23-Nov-1992	    | 4	     | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com		 | 26-Oct-1984      | 2	     | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989 		| 1	     | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And I am on the developer page

Scenario: see the correct information displayed on the developer page
  Given I am on the developer page
  Then I should see a list of "Projects"
  And I should see "Airbears"
  When I click on "Airbears"
  Then I should on the developer page for "Airbears"
  And I should see the project "Airbears"
  And I should see a list of issues under that project
  
Scenario: see the correct issues displayed for a project
  Given I am on the developer page
  And I should see the project "Airbears"
  And I should see action: "login", as_a: "Student", so_that: "I can go on the internet", i_want: "Login to work"
  And I should see action: "connection", as_a: "IT Professional", so_that: "I can connect to the network", i_want: "The network to be up"
