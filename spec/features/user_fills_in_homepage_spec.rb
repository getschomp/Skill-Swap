require 'rails_helper'

feature " User fills in main form on homepage ", %q{
  As someone who knows japanese(example skill)
    I want to find out how many other users both want to learn japanese(example skill)
    and already know ruby(example skill)
  So that I can decide whether I want to sign up for an account and barter for skills.

  Acceptance Criteria:
  - [ ] user inputs a skill they want to learn from a drop down menu of skills
  - [ ] user inputs a skill that they already know and are willing to teach from a drop down menu of skills
  - [ ] user clicks a button("Find People") to signify that they are done
  - [ ] expect the page to tell the user how many people match the specified criteria
  - [ ] expect page to ask the user user to sign up with those attribues
  - [ ] if they are the first user that matches the combination expect a diffrent prompt
    than if users exist in the database that match the current users criteria.
  - [ ] expect the new form on the next page to already have inputed skills filled out in appropriate places
  - [ ] if the skills are not in the database expect the page to propmt the user to sign up for an account
    and add the skill

  } do

  # what if the user dosn't find the skill that they want in
  # the database and they have to add a new skill to the database?
  # thats another test?
  #
  # these slect boxes will need to be searchable select boxes but i'll just write the tests
  # like they are your typical select boxes for now

  #happy path!
  scenario "User fills out both select boxes and there are other users that meet their criteria" do
  


  #not as happy but still happy path!
  scenario "User fills out both select boxes and their are no users that meet their criteria"
    visit root_path




  end
