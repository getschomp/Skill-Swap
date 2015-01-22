require 'rails_helper'

feature "User views all skills and searches for one", %q{
  As a student and teacher
  I want to find other users by name
  So that I can view there profiles

  Acceptance Criteria:
  - [ ] The user index page will first include all users
  - [ ] I can type in a users name and it will update the
  user index page with
  } do

    #add autocomplete for skills column as time allows

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfullly finds the page for the skill they are looking for" do
      skill1 = FactoryGirl.create(:skill)
      skill2 = FactoryGirl.create(:skill)
      skill3 = FactoryGirl.create(:skill)
      skill4 = Skill.create(name:"Photography")
      visit skills_path
      fill_in "Search", with: skill4.name
      click_on "Search Skills"
      expect(page).to have_content(skill4.name)
      expect(page).to_not have_content(skill1.name)
    end

    scenario "User leaves search form blank and sees all skills" do
      skill1 = FactoryGirl.create(:skill)
      skill2 = FactoryGirl.create(:skill)
      skill3 = FactoryGirl.create(:skill)
      visit skills_path

      expect(page).to have_content(skill1.name)
      expect(page).to have_content(skill2.name)
      expect(page).to have_content(skill3.name)
    end
  end
