require 'rails_helper'

feature "User adds a skill", %q{
  As someone who knows(or wants to learn) a skill not in the database
  I want to add a new skill to the website
  So that I can add it to my profile

  Acceptance Criteria:
  - [ ] The user must specify a name for a success message
  - [ ] The user can optionally add a category, skill description,
        wikipedia url and avatar
  - [ ] If the user dosn't specify the required
        information they will get an error
  - [ ] The skill name must be under 40 characters
  - [ ] The category must be under two words
  - [ ] The user will be redirected to the skill show page when they
      sumbit a skill
  } do

  before(:each) do
   @user = FactoryGirl.create(:user)
   sign_in(@user)
  end

  scenario "User submits a skill with all feilds filled in" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    select "Fitness", :from => "Category"
    fill_in "Description", with: skill1.description
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits a skill with name and category filled in" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    select "Fitness", :from => "Category"
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits a skill without a category" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
  end
  scenario "User submits without filling in the form" do
    visit new_skill_path
    click_button "Create Skill"
    expect(page).to have_content "can't be blank"
  end
  scenario "User isn't signed in and can't add a skill" do
    visit new_skill_path
    click_on "Sign Out"
    visit new_skill_path
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
  scenario "a user can not add a skill to another users profile" do
    # no link to add a skill when you are not the current user
    # if you try to manually visit the path to add a skill you are not allowed
    skill1 = FactoryGirl.create(:skill)
    had_skill = HadSkill.create(skill_id: skill1.id, user_id: @user.id)
    click_on "Sign Out"
    user2 = FactoryGirl.create(:user)
    sign_in(user2)
    visit edit_user_path(@user)
    expect(page).to_not have_content "Add Skill"
    visit user_path(@user)
    expect(page).to_not have_content "Add Skill"
    visit new_user_wanted_skill_path(@user)
    expect(page).to_not have_content "You are not authorized to edit this users skills."
  end
end
