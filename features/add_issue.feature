Feature: Adding frustrating issues

  As a frustrated community member,
  So that I can voice my frustrations,
  I want to post issues onto the website for competent people to fix

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | action				 | goal					| identity_tags	 | date_entered |
  | Airbears            | trying to get on the internet    	 | download lecture notes     		| student	 | 25-Nov-1992  |
  | Perimeter Buses     | waiting for the bus to come		 | get to interview on time   		| professor	 | 26-Oct-1984  |
  | CS169               | trying to walk from Soda to LiKaShing	 | get to class in 10 minutes  		| TA 		 | 21-Jul-1989  |
  | BSpace              | trying to access Anthro160 homepage    | trying to view midterm study guide 	| GSI 		 | 10-Aug-2011  |
  | Airbruins           | trying to view webcasts    		 | study for midterm 	  		| student	 | 13-Oct-2012  |
  | Airplatypuses       | trying to swim    			 | don't want to drown			| platypus 	 | 01-May-2004  |

  And  I am on the home page

# Page 1
Scenario: see the correct information displayed on the front page
  Given I am on the Sucks.Berkeley.edu home page
  Then I should see only a text box followed by the word "Sucks!"

Scenario: enter a new issue
  Given I am on the Sucks.Berkeley.edu home page
  And I fill in the text box with "Telebears"
  And I click the submit arrow
  Then I should be on Page 2 for the issue "Telebears"
  And I should see 'Telebears Sucks!' at the top of the page
  And I should see "What were you doing when the problem occurred?"

# Page 2

Scenario: enter a new action
  Given I am on Page 2 for "Airbears" with the correct information displayed
  And I fill in the text box with "trying to log out"
  And I click the submit arrow
  Then I should be on Page 3 for the issue "Airbears"
  Then I should see 'Airbears Sucks!' at the top of the page
  And I should see 'trying to log out' under that
  And I should see "What were you trying to accomplish?"

# Page 3

Scenario: enter a new goal
  Given I am on Page 3 for "Airbears" with the correct information displayed
  And I fill in the text box with "to watch Hulut"
  And I click the submit arrow
  Then I should be on Page 4 for the issue "Airbears"
  Then I should see 'Airbears Sucks!' at the top of the page
  And I should see 'trying to get on the internet' under that
  And I should see 'to watch Hulu' under that
  Then I should see "Last Step! Please help us identify yourself (e.g. student, professor)"
#  And I should see a radio form underneath asking "Help us identify you:" with the choices "student", "faculty", "staff", and "other"

# Page 4
Scenario: see the correct information displayed on the fourth page
  Given I am on Page 4
  And I see “Airbears sucks!” at the top of the page
  And I see "trying to get on the internet" under that
  And I see "download lecture notes" under that
#  Then I should see a radio form underneath asking "Help us identify you:" with the choices "student", "faculty", "staff", and "other"
  Then I should see a text box underneath that asks "Last Step! Please help us identify yourself (e.g. student, professor)"

Scenario: choose an identity-tag
  Given I am on Page 4
  And I see “Airbears sucks!” at the top of the page
  And I see "trying to get on the internet" under that
  And I see "download lecture notes" under that
#  Then I should see a radio form underneath asking "Help us identify you:" with the choices "student", "faculty", "staff", and "other"
  Then I should see a text box underneath that asks "Last Step! Please help us identify yourself (e.g. student, professor)"
  And I select "student"
  And I press "Submit"
  Then I should see “Airbears sucks!” at the top of the page
  And I should see "trying to get on the internet" under that
  And I should see "download lecture notes" under that
  And I should see "student" under that
  And I should be on Page 5
