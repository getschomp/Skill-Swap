require 'rails_helper'

feature " User adds a skill ", %q{
  As someone who knows(or wants to learn) a skill not in the database
  I want to add a new skill to the website
  So that I can add it to my profile

  Acceptance Criteria:
  - [ ] The user must specify a name and category for a sucess message
  - [ ] The user can optional add a skill descrition, wikipedia url and avatar
  - [ ] If the user dosn't specify the required information they will get an error


  } do

    scenario "User submits a skill with all feilds filled in" do
      visit new_skill_path

    scenario "User submits a skill with name and category filled in" do


    scenario "User submits a skill without a category"


    scenario "User submits without filling in the form"
      

    end




end
