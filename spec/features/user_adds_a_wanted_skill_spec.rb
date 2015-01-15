require 'rails_helper'

feature "User adds a wanted skills on profile", %q{
  As someone who knows a skill in the database
  I want to add the skill to my profile
  So that others know I want to learn the skill

  Acceptance Criteria:

  - [ ] The user can navigate from their user profile to
        a page where they can add new wanted_skills
  - [ ] If the skill already exists it finds that skill
  - [ ] If the skill dosn't exist it adds that skill
  - [ ] The user must specify a name for a success message
  - [ ] The user can optionally add a current skill level, requested teacher skill level
        and a descirption of why they want to learn the skill
  - [ ] If the user dosn't specify the required
        information they will get an error
  } do

  #add autocomplete for skills column as time allows

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfully adds a skill that they want to learn with optional feilds" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        click_on "Add Skill"
      end
      fill_in "Skill Name", with: skill1.name
      select "Beginner", :from => "How well do you know this skill?"
      select "Advanced", :from => "How skilled should your teacher be?"
      fill_in "Why do you want to learn this skill? Do you Have any experience with this skill?",
      with: "because I signed up for a bike race in January"
      click_button "Add Skill to Profile"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    scenario "User sucessfully adds a skill that they want to learn with all feilds" do
      skill1 = FactoryGirl.create(:skill)=
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        click_on "Add Skill"
      end
      fill_in "Skill Name", with: skill1.name
      select "Beginner", :from => "How well do you know this skill?"
      select "Advanced", :from => "How skilled should your teacher be?"
      fill_in "Why do you want to learn this skill? Do you Have any experience with this skill?",
      with: "because I signed up for a bike race in January"
      click_button "Add Skill to Profile"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    scenario "User sucessfully adds a wanted skill without optional feilds" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        click_on "Add Skill"
      end
      fill_in "Skill Name", with: skill1.name
      click_button "Add Skill to Profile"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    scenario "User submits a form leaving every peice blank" do
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        click_on "Add Skill"
      end
      click_button "Add Skill to Profile"
      expect(page).to have_content "can't be blank"
    end
  end
