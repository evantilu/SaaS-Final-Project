Feature: Create new account, sign in and sign out

  As a user for this calendar app
  I should be able to create and sign in to my own account
  I also should be able to log out


Scenario: create an account, log out and sign in again
  Given I am on the sign in page
  When I follow "Sign Up"
  And  I sign up with the User id "test@gmail.com"
  And  I fill in "Password" with "12345"
  And  I press "Sign up"
  Then I should be on the home page
  When I follow "Log Out"
  Then I should be on the sign in page
  And I sign in with the User id "test@gmail.com"
  And I fill in "Password" with "12345"
  And I press "Sign in"
  Then I should see "test@gmail.com"
  Then I follow "Log Out"
  Then I should be on the sign in page