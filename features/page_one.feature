Feature: Auto-fill issues

  As a frustrated community member,
  So that I can voice my frustrations,
  I want to post issues onto the website for competent people to fix

Background: issues have been added to database

  Given the following issues exist:
  | issue_name              | claimed | date_entered |
  | Airbears                | Y       | 25-Nov-1992  |
  | Perimeter Buses         | Y       | 26-Oct-1984  |
  | CS169                   | N       | 21-Jul-1989  |
  | BSpace                  | N       | 10-Aug-2011  |
  | Airbruins               | N       | 13-Oct-2012  |
  | Airplatypuses           | N       | 01-May-2004  |

  And  I am on the Sucks.Berkeley.edu home page
  
Scenario: see the correct information displayed on the front page
  Given I am on the Sucks.Berkeley.edu home page
  Then I should see only a text box followed by the word "sucks!"

Scenario: enter a new issue
  Given I am on the Sucks.Berkeley.edu home page
  And I type "Telebears" into the text box
  Then I should see “Telebears sucks!” at the top of the page
  And I should see a second text box with the question “what were you doing doing when the problem occurred?”

Scenario: enmter an existing issue
  Given I am on the Sucks.Berkeley.edu home page
  And I type "Air" into the text box
  Then I should a drop-down menu with the entries "Airbears", "Airbruins", and "Airplatypuses"