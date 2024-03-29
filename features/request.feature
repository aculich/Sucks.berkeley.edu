Feature: Request to work on a project

    As a prospective developer
    So that I can request to work on a project
    I want to see a link to a request form on this page
    
    As an IT professional
    I want the form to include name, email, and Pivotal account
    So we can add users to the Pivotal project

    As a prospective developer
    I want this form to be as short as possible
    So it does not require a lot of my time to begin working on a project
        
Background: issues have been added to database

  Given the following issues exist:
  | name              | link_to_uservoice  | date_entered     | votes  | action                | as_a              | so_that                     | i_want                           |
  | Airbears            | google.com         | 25-Nov-1992      | 3      | login                 | Student           | I can go on the internet    | Login to work                    |
  | Airbears            | google.com         | 23-Nov-1992      | 4      | connection            | IT Professional   | I can connect to the network| The network to be up             |
  | Perimeter Buses     | google.com     | 26-Oct-1984      | 2      | waiting for a bus     | Professor         | I can get to class on time  | To know when the bus will arrive |
  | CS169               | google.com         | 21-Jul-1989    | 1      | working on a project  | Student           | I can pass the class        | The website to work              |
  
  And  I am on the home page

Scenario: Check to see that the I AM A DEVELOPER button exists
  Given I am on the Issue Info Page for I can go on the internet
  Then I should see "I AM A DEVELOPER"
  
Scenario: Developer request form
  Given I am on the Issue Info Page for I can go on the internet
  And I follow "I AM A DEVELOPER"
  Then I should see a text box for Name, Email, and Pivotal Account
  And I fill in Name with Sue and Email with 123@gmail.com and Account with suesylvester
  And I press Request
  Then I should be on the Issue Info Page for I can go on the internet
  #And I should see "Your request has been sent"
