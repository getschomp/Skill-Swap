require 'rails_helper'

feature "User sucessfully adds a had skill to profile", %q{
  As someone who wants to learn skills
  I want to add skills that I have
  So that others can find me by what I know

  Acceptance Criteria:
  - [ ] The user must specify a name for a success message
  - [ ] The user can optionally add a current skill level and a descirption
  of there experience
  - [ ] If the user dosn't specify a name they will get an error and stay on the same page
  } do

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfully adds a skill that they already know with optional feilds" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.had_skill") do
        click_on "Add Skill"
      end
      fill_in "Skill Name", with: skill1.name
      select "Advanced", :from => "How well do you know this skill?"
      fill_in "Describe your experience with this skill.",
      with: "I've been bike racing since I was 5"
      click_button "Add Skill to Profile"
      expect(page).to have_content "sucessfully"
      expect(page).to have_content skill1.name
      expect(page).to_not have_content "error" || "errors"
    end
    scenario "User sucessfully adds a skill they know with just the name" do
      skill1 = FactoryGirl.create(:skill)
      visit edit_user_path(@user)
      within(:css, "div.had_skill") do
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
      within(:css, "div.had_skill") do
        click_on "Add Skill"
      end
      click_button "Add Skill to Profile"
      expect(page).to have_content "Error"
    end
    scenario "a user can not add a skill to another users profile" do
      # no link to add a skill when you are not the current user
      # if you try to manually visit the path to add a skill you are not allowed
      skill1 = FactoryGirl.create(:skill)
      HadSkill.create(skill_id: skill1.id, user_id: @user.id)
      click_on "Sign Out"
      user2 = FactoryGirl.create(:user)
      sign_in(user2)
      visit edit_user_path(@user)
      expect(page).to_not have_content "Add Skill"
      visit user_path(@user)
      expect(page).to_not have_content "Add Skill"
      visit new_user_had_skill_path(@user)
      expect(page).to have_content "You are not authorized."
    end
    scenario "a user can not add the same skill to wanted skills twice" do
      skill1 = Skill.create(name: "Running")
      HadSkill.create(skill_id: skill1.id, user_id: @user.id)
      visit new_user_had_skill_path(@user)
      fill_in "Skill Name", with: skill1.name
      click_button "Add Skill to Profile"
      expect(page).to have_content "Error"
    end
  end
