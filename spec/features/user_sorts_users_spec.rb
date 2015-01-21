require 'rails_helper'

feature "User searches for another user", %q{
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

    scenario "User sucessfullly finds who they are looking for" do
      #create the skills Ruby and Javascript
      skill1 = Skill.create(name: "Ruby")
      skill2 = Skill.create(name: "Javascript")
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      user4 = User.create(username: "nicole", email: "someemail@gmail.com", password:"password89")
      #create a had skill and wanted skill that matches @user for user1
      had_skill_user_1
      had_skill_user_2
      wanted_skill_user_1
      wanted_skill_user_2
      #create the current user with had and wanted skills


      visit users_path
      #select those had and wanted skills by name
      select skill1.name, :from => "I'll teach"
      select skill2.name, :from => "They'll teach"
      #the select box will actually return the id

      visit users_path
      fill_in "Search", with: user4.username
      click_on "Search Users"
      expect(page).to have_content(user4.username)
      expect(page).to_not have_content(user1.username)
    end

    scenario "User leaves search form blank and sees all users arranged by time created " do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      visit users_path

      user3.username.should appear_before(user2.username)
      user2.username.should appear_before(user1.username)
      user1.username.should_not appear_before(user2.username)
      expect(page).to have_content(user1.username)
    end
  end
