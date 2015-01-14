require 'rails_helper'

feature "User adds wanted skills to profile", %q{
  As someone who knows a skill in the database
  I want to add the skill to my profile
  So that others know I want to learn the skill

  Acceptance Criteria:
  - [ ] The user must specify a name and category for a success message
  - [ ] The user can optionally add a current skill level and a descirption
        of why they want to learn the skill
  - [ ] If the user dosn't specify the required
        information they will get an error
  - [ ] The user will be able to remove skills by clicking a remove skill checkbox
  } do

    before(:each) do
      @user = FactoryGirl.build(:user)
      sign_in(@user)
    end

    scenario "User sucessfully adds a skill that they want to learn" do
      skill1 = FactoryGirl.create(:skill)
      wanted_skill1 = WantedSkill.build(skill_id: skill1.id, user_id: @user.id, current_level: "novice", why_description: "just because")
      visit edit_user_path
      select "Biking", :from => "Category" #to be autocomplete
      select "Bike Racing1", :from => "Wanted Skill" #to be autocomplete
      fill_in "Your current skill Level", with: "Beginner"
      fill_in "Why do you want to learn this skill", with: "because I signed up for a bike race in January"
      click_button "Add Skill"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
     end
    scenario "User submits a skill with name and category filled in" do
      skill1 = FactoryGirl.build(:skill)
      wanted_skill = Skill.create(skill:"Bike Racing#{n}")
      visit new_skill_path
      fill_in "Name", with: skill1.name
      save_and_open_page
      select "fitness", :from => "Category"
      click_button "Create Skill"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    # scenario "User submits a skill without a category" do
    #   skill1 = FactoryGirl.build(:skill)
    #   visit new_skill_path
    #   fill_in "Name", with: skill1.name
    #   click_button "Create Skill"
    #   expect(page).to have_content "sucessfully"
    #   expect(page).to have_content skill1.name
    #   expect(page).to have_content current_user.name
    #   expect(page).to_not have_content "error" || "errors"
    # end
    # scenario "User submits without filling in the form" do
    #   visit new_skill_path
    #   click_button "Create Skill"
    #   expect(page).to have_content "Add a Skill"
    #   expect(page).to have_content "error" || "errors"
    # end
    # scenario "User isn't signed in and can't add a skill" do
    #   skill1 = FactoryGirl.build(:skill)
    #   visit new_skill_path
    #   fill_in "Name", with: skill1.name
    #   fill_in "Category", with: skill1.category
    #   fill_in "Description", with: skill1.description
    #   # test for avatar(optional)
    #   click_button "Create Skill"
    #   expect(page).to have_content "sucessfully"
    #   expect(page).to have_content skill1.name
    #   expect(page).to have_content current_user.name
    #   expect(page).to_not have_content "error" || "errors"
    # end
  end
