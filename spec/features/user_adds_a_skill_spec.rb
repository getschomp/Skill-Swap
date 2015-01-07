require 'rails_helper'

feature "User adds a skill", %q{
  As someone who knows(or wants to learn) a skill not in the database
  I want to add a new skill to the website
  So that I can add it to my profile

  Acceptance Criteria:
  - [ ] The user must specify a name and category for a success message
  - [ ] The user can optionally add a skill description,
        wikipedia url and avatar
  - [ ] If the user dosn't specify the required
        information they will get an error
  - [ ] The skill name must be under 40 characters
  - [ ] The category must be under two words
  - [ ] The user will be redirected to the edit profile page when they
      sumbit a skill so that they can add the skills
  } do

  before(:each) do
   @user = FactoryGirl.build(:user)
   sign_in(@user)
  end

  scenario "User submits a skill with all feilds filled in" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    select "fitness", :from => "category"
    fill_in "Description", with: skill1.description
    # test for avatar(optional)
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to have_content current_user.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits a skill with name and category filled in" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    save_and_open_page
    select "fitness", :from => "Category"
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to have_content current_user.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits a skill without a category" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to have_content current_user.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits without filling in the form" do
    visit new_skill_path
    click_button "Create Skill"
    expect(page).to have_content "Add a Skill"
    expect(page).to have_content "error" || "errors"
  end
  scenario "User isn't signed in and can't add a skill" do
    skill1 = FactoryGirl.build(:skill)
    visit new_skill_path
    fill_in "Name", with: skill1.name
    fill_in "Category", with: skill1.category
    fill_in "Description", with: skill1.description
    # test for avatar(optional)
    click_button "Create Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to have_content current_user.name
    expect(page).to_not have_content "error" || "errors"
  end
end
