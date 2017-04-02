Feature: Entry CRUD
 
  Scenario: New, Create, Show

    # Only able to create a new entry if logged in
    Given I go to the entry index
    # Then I should not see "New Entry"
    # When I log in as "bbluth"
    # And I go to the entry index
    And I follow "New Entry"
    Then I should see "Share with the world:"

    When I fill in "entry_title" with "James Bond Obituary"
    And I fill in "entry_content" with "James was a great man."
    And I press "Share this with the world!"
    Then I should see "James Bond Obituary"
    And I should see "James was a great man."

