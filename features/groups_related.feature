Feature: Create, join, and leave group

  As a user for this calendar app
  I should be able to create a new group for meetings
  I should be able to join existing groups 
  And I should be able to leave a group

Background: already logged in
  Given I am on the sign in page
  And I follow "Sign Up"
  When I sign up with the User id "test@gmail.com"
  And I fill in "Password" with "12345"
  And I press "Sign up"
  Then I should be on the home page

Scenario: create and join a new group, leave a joined group
  When I click "New Group"
  And  I fill in "group_groupname" with "group1"
  And  I fill in "group_description" with "schedule for group1"
  And  I press "Create Group"
  Then I can see the group page for "group1"
  When I follow "Join"
  And I follow "My Groups"
  Then I should see "group1"
  When I follow "group1"
  And I follow "Quit Group"
  Then I should see "Successfully Quited Group"
  When I follow "My Groups"
  Then I should not see "group1"