require 'rails_helper'

feature "Sign up for an account", %q{
  As someout who wants to trade skills
  I want to sign up for the skill trade app
  so that I can use all of its awesome features.

  Acceptance Criteria

  -[ ]There is a link to sign up on the homepage
    (can be one in header if you want to bypass the select boxes)
  -[ ]If I fill in my first name, last name, email and password
    correctly I am able to sign up for an account
    -[ ]If the password and password confirmation
    correctly I am able to sign up for an account

  }

  scenario "user provides valid information" do
    visit root_path
    click on "Sign Up"

    fill_in "First Name", with: "Allison"
    fill_in "Last Name", with: "Browne"
    fill_in "Password",  with: "gnarly_scoby_2014"
    fill_in "Password Confirmation", with: "gnarly_scoby_2014"
    select "MA", from => "states"
    select "Boston", from => "cities"
    click_on "Sign Up"

    expect(page).to have_message "Welcome to Skill Trade!"
  end
end
