Feature: Index Page

As a frustrated person in the Berkeley community
I want to be taken to an index page of problems after I have submitted my own problem and see my summary page,
So that I can browse through similar problems or see what problems other members of the Berkeley community are having.

Background: issues have been added to database

  Given the following issues exist:
  | name    	        | action				 | goal					| identity_tags	 | date_entered |
  | Airbears            | trying to get on the internet    	 | to watch Hulu	     		| student	 | 25-Nov-1992  |
  | Perimeter Buses     | waiting for the bus to come		 | get to interview on time   		| professor	 | 26-Oct-1984  |
  | CS169               | trying to walk from Soda to LiKaShing	 | get to class in 10 minutes  		| TA 		 | 21-Jul-1989  |
  | BSpace              | trying to access Anthro160 homepage    | trying to view midterm study guide 	| GSI 		 | 10-Aug-2011  |
  | Airbruins           | trying to view webcasts    		 | study for midterm 	  		| student	 | 13-Oct-2012  |
  | Airplatypuses       | trying to swim    			 | don't want to drown			| platypus 	 | 01-May-2004  |

Scenario: see the index page displayed
  Given I add a new issue about Telebears
  Then I should be on the index page
  And I should see a list of issues that are in the database

Scenario: see the last-added issue highlighted
  Given I am on the index page
  Then I should see the issue that I just added highlighted