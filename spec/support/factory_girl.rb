require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "l33tskills#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    sign_in_count 0

    wanted_skill
    had_skill
  end

  factory :skill do
    sequence(:name) {|n| "Bike Racing#{n}" }
    sequence(:category) {|n| "biking#{n}" }
    description "Bike racing is a competitive sport in which people try to go faster than one another while on bikes"
    #avatar
    
    wanted_skill
    had_skill
  end


end
