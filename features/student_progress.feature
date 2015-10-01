Feature: Viewing student progress

Background:
  Given I am the teacher of "Year 6A" with students "Ann"
  And there is a maths curriculum "NC2014"
  And there is a pedagogy "PBL"

Scenario: when the group has a subject
  Given "Ann" has been marked against two objectives
  And "Ann" has been marked against one pedagogy
  And "Ann" has been marked against na against one pedagogy
  When I visit the student page for "Ann"
  Then I should see student tabs for "Activity log,Maths,Pedagogy"
  And I should see 4 activity records
  And I should see 1 indicator progress records for "Year 1"
  And I should see 1 indicator progress records for "PBL"
