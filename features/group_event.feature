Feature: Create and delete a group event

    As an admin of a group
    I should be able to create a group event
    And I should be able to delete the group event

Background: user logged in and created a group

    Given I am on the sign in page
    And I follow "Sign Up"
    When I sign up with the User id "foo@gmail.com"
    And I fill in "Password" with "bar"
    And I press "Sign up"
    Then I should be on the home page

    #create a new group
    When I click "New Group"
    And  I fill in "group_groupname" with "Foo"
    And  I fill in "group_description" with "schedule for Foo"
    And  I press "Create Group"
    Then I can see the group page for "Foo"


Scenario: add a group event
    # test whether I am on the right page
    # Then I should see "December 2021"
    When I follow "Group Event addition"
    And  I fill in "Title" with "winter break"
    And  I fill in "Content" with "Yeah vacation"
    And  I press "Save"
    Then I can see the group page for "Foo"
    And I should see "winter break"


Scenario: send a reminder
    #Then I should see "winter break 2021-12-18"
    #Then I should see "Send A Reminder"
    #When I follow "Next"
    #And I should see "An email reminder has been sent to all group members"