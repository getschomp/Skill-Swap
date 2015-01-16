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
      within(:css, "div.wanted_skill") do
        click_on "Add Skill"
      end
      click_button "Add Skill to Profile"
      expect(page).to have_content "can't be blank"
    end
  end
