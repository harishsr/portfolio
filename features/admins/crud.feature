Feature: Admin Registration & Authentication

  Scenario: Registration
    Given I go to the home page
    Then I should not see "Welcome"
    And I should not see "Sign off"
    And I should not see "Sign up"
    And there are "0" objects in "Admin"
    And I follow "Sign in"
    And I follow "Sign up"

    # Unsuccessful registration
    When I press "Sign up"
    Then I should see "8 errors"
    And there are "0" objects in "Admin"

    # Successful registration
    When I fill in "admin_first_name" with "Arnold"
    And I fill in "admin_last_name" with "Schwarzenegger"
    And I fill in "admin_email" with "new_user@skynet.com"
    And I fill in "admin_username" with "terminator1000"
    And I fill in "admin_password" with "passwordpassword"
    And I fill in "admin_password_confirmation" with "passwordpassword"
    And I press "Sign up"
    Then there are "1" objects in "Admin"
    And I should not see "errors on this page"
    And I should see "Welcome! You have signed up successfully."
    And I should not see "Sign in"

  Scenario: Authentication
    Given I go to the home page
    And admin "terminator1000" has password "password"
    And I follow "Sign in"

    # Unsuccessful login
    When I press "Log in"
    Then I should see "Invalid Username or password."

    # Successful login
    When I fill in "admin_username" with "terminator1000"
    And I fill in "admin_password" with "password"
    And I press "Log in"
    Then I should see "Signed in successfully."

  # MODIFYING PROFILES IS POSSIBLE BUT NOT LINKED TO OR TESTED YET.
  # THIS WILL BE A LATER FEATURE AS IT REQUIRES MORE DECISIONS ABOUT
  # LAYOUT, ETC.
  #
  # Scenario: Modifying
  #   Given I go to the home page
  #   And I log in as "terminator1000"
  #   And I follow "Profile Settings"
  #
  # DESTROYING PROFILES IS POSSIBLE BUT NOT LINKED TO OR TESTED YET.
  # THIS WILL BE A LATER FEATURE AS IT REQUIRES MORE DECISIONS ABOUT
  # LAYOUT, ETC.
  #
  # Scenario: Destroying
  #   Given I go to the home page
  #   And I log in as "terminator1000"
