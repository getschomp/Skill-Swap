require 'rails_helper'

feature "User edits a profile", %q(
As someone who wants to swap skill,
I would like to have a profile,
So that others can find me by my skills
- [ ] The user can visit the edit profile page from any page(test homepage)
-[ ] User can optionally provide their age, gender,
and an 'about me' section
-[ ] A user can navigate to a page that allows them to add skills that they have to their page.
-[ ] A user can navigate to a page that allows them to add skills that they want to their profile page.
* Changes will be shown on their public profile
) do

  before(:each) do
    @user = FactoryGirl.build(:user)
    sign_up(@user)
  end

  scenario "User visits their profile from the homepage" do
    visit root_path

    click_on "Edit User Profile"
    expect(page).to have_content "Location"
    expect(page).to have_content "Gender"
    expect(page).to have_content "About Me"
    expect(page).to have_content "Editing Profile for #{@user.username.capitalize}"
  end

  scenario "User fills in all fields" do
    visit edit_user_path(User.first)
    fill_in "Gender", with: @user.gender
    fill_in "About Me", with: @user.about_me
    click_on "Edit Profile"

    expect(page).to have_content @user.gender
    expect(page).to have_content @user.about
  end

  scenario "User fills in no fields" do
    visit edit_user_path(User.first)
    click_on "Edit Profile"
    expect(page).not_to have_content "You did not fill in anything"
  end

  scenario "User can't edit another users profile" do
    @user1 = User.first
    @user2 = FactoryGirl.create(:user)
    click_on "Sign Out"
    sign_in(@user2)
    visit edit_user_path(@user1)
    expect(page).to have_content "You're not authorized to edit this profile!"
  end

  scenario "unregistered user can't edit another users profile" do
    @user1 = User.first
    click_on "Sign Out"
    visit edit_user_path(@user1)
    expect(page).to have_content "You're not authorized to edit this profile!"
  end

  scenario "user sucessfully navigates to a page to add wanted skills" do
    @user = User.first
    click_on "Add a skill you want to know"
    expect(page).to have_content "What do you want to know #{@user.name}?"
    expect(page).to have_content "Tell others about your skills."
  end

  scenario "user sucessfully navigates to a page to add skills they have" do
    @user = User.first
    click_on "Add a skill you know"
    expect(page).to have_content "What would you like to learn #{@user.name}?"
    expect(page).to have_content "Tell others what skills you are seeking."
  end
end
