require 'rails_helper'

feature "User can delete skills from profile", %q{
  As a user
  I want to delete skills from my profile
  So that others can no longer see them

  Acceptance Criteria:

  - [ ] The user can delete a wanted skill
  - [ ] The user can delete a had skill
  } do

    #add autocomplete for skills column as time allows

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfully deletes a wanted skill" do
      skill1 = Skill.create(name: "Biking")
      WantedSkill.create(skill_id: skill1.id, user_id: @user.id)
      visit user_path(@user)
      within(:css, "div.wanted_skill") do
        click_on "Delete Skill"
      end
      expect(page).to have_content "Skill successfully deleted from profile."
      expect(page).to_not have_content skill1.name
    end
    scenario "User sucessfully deletes a had skill" do
      skill1 = Skill.create(name: "Biking")
      HadSkill.create(skill_id: skill1.id, user_id: @user.id)
      visit user_path(@user)
      within(:css, "div.had_skill") do
        click_on "Delete Skill"
      end
      expect(page).to have_content "Skill successfully deleted from profile."
      expect(page).to_not have_content skill1.name
    end
    scenario "a user can not delete a skill from another users profile" do
      # no link to add a skill when you are not the current user
      # if you try to manually visit the path to add a skill you are not allowed
      skill1 = FactoryGirl.create(:skill)
      #TODO: this variable is unused
      wanted_skill = WantedSkill.create(skill_id: skill1.id, user_id: @user.id)
      click_on "Sign Out"
      user2 = FactoryGirl.create(:user)
      sign_in(user2)
      # visit edit_user_path(@user)
      # expect(page).to_not have_content "Add Skill"
      # save_and_open_page
      # visit user_path(@user)
      # expect(page).to_not have_content "Add Skill"
      # visit new_user_wanted_skill_path(@user)
      # expect(page).to_not have_content "You are not authorized to edit this users skills."
    end
  end
