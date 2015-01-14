require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "l33tskills#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    sign_in_count 0

    end

  factory :skill do
    sequence(:name) {|n| "Bike Racing#{n}" }
    category "biking"
    description "Bike racing is a competitive sport in which people try to go faster than one another while on bikes"

    end

  factory :wanted_skill do
    current_level "Beginner"
    why_description "I want to take my biking to the next level"

    skill
    user
  end



  factory :had_skill do
      expertise_level "Expert"
      experience "5 years Racing Bikes in college"

      skill
      user
    end


end
