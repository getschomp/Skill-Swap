require 'rails_helper'

feature "Any user can edit the skill desciptors", %q{
  #optional challenge: the users edits must be approved by the site admins
  As a user that wants to improve the definition of a skill
  I want to edit the skills attributtes
  So that the skill page will be more accurate

  Acceptance Criteria:
  - [ ] The user can navigate from the skills show page to the skill edit page
  - [ ] The user must be signed in to edit the skills page
  - [ ] The user can update the description, wikipedia url and avatar
  - [ ] The user can update the description, wikipedia url and avatar
  - [ ] If the user tries to update a name they will encounter an error
    for future ref:only admins will be able to edit the skills name or delete the skill page
    for future ref:only specific avatar urls will end up on the homepage shuffle
  } do

    #happy path!
    scenario "user can navigate from the skills show page to the skill edit page" do
      #create object

    #happy path!
    scenario "User fills out description, url and avatar" do
    #create object

    #sad path
    scenario "User tries to change name and gets and error" do
      fill_in "Name"
      #expect page to have content

    end

end
