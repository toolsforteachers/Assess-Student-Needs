Feature: Viewing student progress

Background:
  Given I am the teacher of "Year 6A" with students "Ann"
  And there is a subject "Maths"

Scenario: when the group has a subject
  Given "Ann" has been marked against two objectives
  When I visit the student page for "Ann"
  Then I should see 3 activity records
  And I should 2 indicator progress records
