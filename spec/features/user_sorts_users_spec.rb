require 'rails_helper'

feature "User sorts users by skills", %q{
  As a student and teacher
  I want to find other users by name
  So that I can view there profiles

  Acceptance Criteria:
  - [ ] I can choose the skills that i want to sort by
  and i will find users that match my selections
  } do

    #add autocomplete for skills column as time allows

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    scenario "User sucessfullly finds who they are looking for by skill type" do
      # create the skills Ruby and Javascript
      skill1 = Skill.create(name: "Ruby")
      skill2 = Skill.create(name: "Javascript")

      # create users to be sorted
      user1 = FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      user_4 = FactoryGirl.create(:user)

      # create matching skills
      UserSkill.create(skill_id: skill1.id, user_id: @user.id, known?: true)
      UserSkill.create(skill_id: skill2.id, user_id: @user.id, known?: false)
      UserSkill.create(skill_id: skill2.id, user_id: user1.id, known?: true)
      UserSkill.create(skill_id: skill1.id, user_id: user1.id, known?: false)

      visit users_path

      # select skills by name
      select skill1.name, :from => "sort[known_skill_id]"
      select skill2.name, :from => "sort[wanted_skill_id]"

      # the select box will actually return the id
      click_on "Sort by Skill Types"
      expect(page).to have_content(user1.username)
      expect(page).to_not have_content(user4.username)
    end

    scenario "User sorts other users by skills and distance" do
      # create the skills Ruby and Javascript
      skill1 = Skill.create(name: "Ruby")
      skill2 = Skill.create(name: "Javascript")

      # create users to be sorted
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)

      # create matching skills for user who is close by
      UserSkill.create(skill_id: skill1.id, user_id: @user.id, known?: true)
      UserSkill.create(skill_id: skill2.id, user_id: @user.id, known?: false)
      UserSkill.create(skill_id: skill2.id, user_id: user1.id, known?: true)
      UserSkill.create(skill_id: skill1.id, user_id: user1.id, known?: false)

      # create skills for matching user who is far away
      UserSkill.create(skill_id: skill1.id, user_id: @user.id, known?: true)
      UserSkill.create(skill_id: skill2.id, user_id: @user.id, known?: false)
      UserSkill.create(skill_id: skill2.id, user_id: user2.id, known?: true)
      UserSkill.create(skill_id: skill1.id, user_id: user2.id, known?: false)

      visit users_path
      # select those had and wanted skills by name
      select skill1.name, :from => "sort[known_skill_id]"
      select skill2.name, :from => "sort[wanted_skill_id]"
      select 5, :from => "sort[miles]"
      # the select box will actually return the id
      click_on "Sort by Skill Types & Distance"
      expect(page).to have_content(user1.username)
      expect(page).to_not have_content(user2.username)
    end

    scenario "User leaves sort boxes and sees all users arranged by time created " do
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
