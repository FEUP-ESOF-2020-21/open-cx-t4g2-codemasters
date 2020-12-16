Scenario: Leave a comment about a talk
  Given A talk's post that I have attended and rated
  When I tap “Leave a comment”
  And I tap "Comment"
  And I write "Really Loved that talk!" in "Comment:"
  And I tap "Leave Comment"
  And I tap "See all comments"
  Then I can see my comment: VER
