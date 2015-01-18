require 'rails_helper'

feature "User starts a conversation", %q{
  As a user
  I want to start a conversation with another user
  So that I can teach or learn a skill.

  Acceptance Criteria:
  - [ ] The user can click a button on the user show page and add a conversation.
  - [ ] When the user creates a conversation they will recive a sucess message.
  - [ ] User who are not a part of the conversation can not view the conversation
  - [ ] the user can view all of there active conversations sorted by time.

  } do

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User creates a new conversation from the user show page" do
      user_2 =
      User.create(username: "fake",
                  email:"fake@gmail.com",
                  gender:"other",
                  about_me:"fake user" )
      visit user_path(user_2)
      expect(page).to have_content "Send Message"
      expect(page).to have_content "A conversation with #{user_2.name}"
      expect(page).to have_content "Conversation sucessfully created!"
    end

    scenario "User not in the conversation attempts to access the conversation" do

    end
    scenario "User views conversations sorted by time on index" do

    end
  end
