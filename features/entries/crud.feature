Feature: Entry CRUD
 
  Scenario: New, Create

    # Must be logged in
    Given I go to the entry index
    Then I should not see "New Entry"
    When I log in as "bbluth"
    And I go to the entry index
    And I follow "New Entry"
    Then I should see "A New Eloquent Entry"

    When I fill in "entry_title" with "James Bond Obituary"
    And I attach a valid image
    And I fill in "entry_content" with "James was a great man."
    And I press "Share this with the world"
    Then I should see "Your entry was created!"
    And I should see "valid_image.jpeg"
    And I should see "James Bond Obituary"
    And I should see "James was a great man."

  Scenario: Index & Show
    Given I log in as "bbluth"
    And "bbluth" has an entry titled "A solid title" with content "Captivating content"
    And "bbluth" has an entry titled "James Bond Obituary" with content "James was a great man."

    # Index
    When I go to the entry index
    Then I should see "A solid title"
    And I should see "Captivating content"
    And I should see "James Bond Obituary"
    And I should see "James was a great man."

    # Show
    When I follow "A solid title"
    Then I should see "A solid title"
    And I should see "Captivating content"
    And I should not see "James Bond Obituary"
    And I should not see "James was a great man."

  Scenario: Edit & Update
    Given I log in as "bbluth"
    And "bbluth" has an entry titled "A solid title" with content "Captivating content"
    And I go to the entry index
    And I follow "A solid title"

    # Edit
    When I follow "Edit"
    And I should see "Edit your Eloquent Entry"
    And I attach a valid image
    And I fill in "entry_title" with "James Bond Obituary"
    And I fill in "entry_content" with "James was a great man."
    And I press "Update this Entry"
    Then I should see "Your entry was updated"

    # Update
    When I go to the entry index
    Then I should not see "A solid title"
    And I should not see "Captivating content"
    And I should see "valid_image.jpeg"
    And I should see "James Bond Obituary"
    And I should see "James was a great man."

  Scenario: Destroy
    Given I log in as "bbluth"
    And "bbluth" has an entry titled "A solid title" with content "Captivating content"
    And I go to the entry index
    And I follow "A solid title"

    When I follow "Destroy"
    Then I should see "Your entry was destroyed."
    And I should not see "A solid title"
    And I should not see "Captivating content"
    And I should not see "valid_image.jpeg"
