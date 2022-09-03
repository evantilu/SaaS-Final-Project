Feature: Add a personal event

  As a user of this meeting scheduling APP
  So that I can quickly add my personal events to the web APP
  I want to see the event added by me

# use yk's version in groups_related feature
#Background: user is logged in
#  # reuse some parts from login feature
#  Given I am on the sign in page
#  And the account "testuser@gmail.com" with password "password1" exists
#  Given user "testuser@gmail.com" with password "password1"
#  And I press "Sign in"
#  #Then I should see "November 2021"
#  Then I should I should see my personal home page

Background: already logged in
  Given I am on the sign in page
  And I follow "Sign Up"
  When I sign up with the User id "test@gmail.com"
  And I fill in "Password" with "12345"
  And I press "Sign up"
  Then I should be on the home page

Scenario: add a personal event
  # test whether I am on the right page
  Then I should see "December 2021"
  When I follow "Event addition"
  And  I fill in "Title" with "Discuss hw 3"
  And  I fill in "Content" with "Discuss something with sb"
  And  I press "Create Event"
  Then I should be on the home page
  And I should see "Discuss hw 3"
