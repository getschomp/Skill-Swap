require 'rails_helper'

feature "User serches for another user", %q{
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

    end

    scenario "User leaves search form blank and sees all users arranged by time created " do
      visit users_path
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      user3.username.should appear_before(user2.username)
      user2.username.should appear_before(user1.username)
      user1.username.should_not appear_before(user2.username)
      expect(page).to_have content(user1.username)
    end
  end
