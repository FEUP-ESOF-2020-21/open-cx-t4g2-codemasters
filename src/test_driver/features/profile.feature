Feature: Profile
  Scenario: Navigate the Bottom Bar
      Given the "Profile" screen
      When I tap "EditProfileBtn"
      And I write "CodeMasters" in "New Name"
      And I submit
      Then I can see "CodeMasters"
      

