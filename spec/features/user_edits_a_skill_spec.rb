require 'rails_helper'

feature "Any user can edit the skill desciptors", %q{
  #optional challenge: the users edits must be approved by the site admins
  As a user that wants to improve the definition of a skill
  I want to edit the skills attributtes
  So that the skill page will be more accurate

  Acceptance Criteria:
  - [ ] The user can navigate from the skills show page to the skill edit page
  - [ ] The user must be signed in to edit the skills page
  - [ ] The user can update the description, wikipedia url and avatar
  - [ ] The user can update the description, wikipedia url and avatar
  - [ ] If the user tries to update a name they will encounter an error
    for future ref:only admins will be able to edit the skills name or delete the skill page
    for future ref:only specific avatar urls will end up on the homepage shuffle
  } do
  #
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario "user edits a skill page" do
    skill1 = FactoryGirl.create(:skill)
    skill_edits = FactoryGirl.build(:skill)
    visit skill_path(skill1)
    click_on "Edit Skill"
    select "Fitness", :from => "Category"
    fill_in "Description", with: skill1.description
    click_button "Update Skill"
    expect(page).to have_content "sucessfully"
    expect(page).to have_content skill1.name
    expect(page).to_not have_content "error" || "errors"
  end
  scenario "User submits a blank form" do
    skill1 = FactoryGirl.create(:skill)
    visit skill_path(skill1)
    click_on "Edit Skill"
    click_button "Update Skill"
    expect(page).to have_content "sucessfully"
  end
  scenario "User isn't signed in and can't add a skill" do
    skill1 = FactoryGirl.create(:skill)
    visit root_path
    click_on "Sign Out"
    visit skill_path(skill1)
    click_on "Edit Skill"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
