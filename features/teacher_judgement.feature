Feature: Teacher makes a judgement

Background:
  Given I am the teacher of "Year 6A" with students "Ann,Bob,Clare"
  And the following indicators:
    | level | name            | key           | description         |
    | 2     | Adding up       | MA2_NUMBERS   | about the indicator |
    | 4     | Measuring stuff | MA3A_MEASURES |                     |
  And I add a judgement for "Year 6A" with indicator "Adding up"

Scenario: fields to be displayed (currently on show page)
  Then I should not see lesson specific fields
  When I follow "Edit Details"
  Then I should not see lesson specific fields

@javascript
Scenario: updating the indicator select menu and seeing values preset on the page
  When I follow "Edit Details"
  And I choose "Level 4" and "Measures" and press the update button
  And I choose "Measuring stuff" from the indicator list
  And I press "Update"
  Then I should see "Measuring stuff" for ".indicator_name"
