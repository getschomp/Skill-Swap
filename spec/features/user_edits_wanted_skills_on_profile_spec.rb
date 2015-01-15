require 'rails_helper'

feature "User edits a wanted skills on profile", %q{
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
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfully adds a skill that they want to learn with optional feilds" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        select skill1.name, :from => "Wanted Skill" #to be autocomplete
        select "Beginner", :from => "How well do you know this skill?"
        fill_in "Describe why wou want to learn this skill?", with: "because I signed up for a bike race in January"
        click_button "Add Skill"
      end
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    scenario "User adds a wanted skill without optional feilds" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        select skill1.category, :from => "Category" #to be autocomplete
        select skill1.name, :from => "Wanted Skill" #to be autocomplete
        click_button "Add Skill"
      end
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "can't be blank" || "error"
    end
    scenario "User submits a form leaving every peice blank" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.wanted_skill") do
        click_button "Add Skill"
      end
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "can't be blank" || "error"
    end
  end