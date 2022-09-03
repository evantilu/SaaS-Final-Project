Feature: Delete a personal event

  As a user who has existing events in the calendar 
  So that I can delete an event that I no longer need 
  I want to see the deleted event disappear from calendar

Background: already logged in and created an event 
  Given I am on the sign in page
  And I follow "Sign Up"
  When I sign up with the User id "test@gmail.com"
  And I fill in "Password" with "12345"
  And I press "Sign up"
  Then I should be on the home page
  
  # create an event
  When I follow "Event addition"
  And  I fill in "Title" with "Discuss hw 3"
  And  I fill in "Content" with "Discuss something with sb"
  And  I press "Create Event"
  Then I should be on the home page
  And I should see "Discuss hw 3"

Scenario: delete a personal event
  When I follow "Discuss hw 3"
  And I follow "Delete"
  Then I should be on the home page
  And I should see "event 'Discuss hw 3' deleted"




  # old Background section used in iter1
  # During iter 2 since there's per user setting etc.
  # try to use yk's method to manually create events
  #Background: events have been added to database

  ## Note: don't know how to add start time. Cucumber complains not found error
  #Given the following events exist:
  #| title                   | content                          | start_time  |
  #| fuckme 1                | Do Saas project                  | 2-Nov-2021  |
  #| Go to gym               | Do some exercise                 | 8-Nov-2021  |
  #| Hang out                | Picnic at central park with Jim  | 10-Nov-2021 |

  #And I am on the home page
  #Then 3 seed events should exist

