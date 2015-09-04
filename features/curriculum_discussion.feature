Feature: Discussing the curriculum

Background:
  Given there is a maths curriculum "NC2014"

Scenario: Logged in as a teacher, choosing an objective to teach
  Given I am the teacher of "Year 6A" with students "Ann"
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields

  When I browse to "Addition and subtraction" and click teach this
  Then I should pick a group and add a lesson with objective "Addition and subtraction"

  When I visit the curricula page
  And I follow "Year 1"
  Then I should see that I already taught "Addition and subtraction"

Scenario: Logged in as a teacher, choosing an objective to teach, but no classes yet
  Given I am the teacher
  And I visit the curricula page
  And I follow "Year 1"

  When I browse to "Addition and subtraction" and click teach this
  Then I should see the new class prompt

Scenario: Not logged in
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields

  When I browse to "Addition and subtraction" and click teach this
  Then I should see the register prompt
