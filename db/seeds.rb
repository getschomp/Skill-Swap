# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

# Begin:Two users that would create a match

    u1 = User.find_or_create_by(username: "fakeuser1" , email: "fakeusersemail1@user.com", password: "fakepass", gender: "male", about_me: "I may be fake but I still wish i could learn skills for free!")
    u2 = User.find_or_create_by(username: "fakeuser2" , email: "fakeusersemail2@user.com", password: "fakepass", gender: "male", about_me: "I may be fake but I still wish i could learn skills for free!")
    skill1 = Skill.find_or_create_by(name: "Japanese", category: "Language" , description: "A language spoken in Japan" , url: "http://en.wikipedia.org/wiki/Japanese_language")
    skill2 = Skill.find_or_create_by(name: "Ruby", category: "Programming Languages" , description: "A elegant and syntatically clear programming language." , url: "http://en.wikipedia.org/wiki/Japanese_language")
    us1 = HadSkill.find_or_create_by(skill_id: skill1.id, user_id: u1.id, expertise_level: "Novice")
    us2 = HadSkill.finfind_or_create_by(skill_id: skill1.id, user_id: u1.id)
    us3 = HadSkill.find_or_create_by(skill_id: skill2.id, user_id: u2.id, expertise_level: "Novice")
    us4 = HadSkill.find_or_create_by(skill_id: skill2.id, user_id: u2.id)
# End:Two users that would create a match

  Category.find_or_create_by(name: "Technology")
  Category.find_or_create_by(name: "Fitness")
  Category.find_or_create_by(name: "Art")
  Category.find_or_create_by(name: "Language")
  Category.find_or_create_by(name: "Programming languages")

  350.times do |n|
    email = "example-#{n+1}@gmail.com"
    password  = "password"
    username = Faker::Internet.user_name
    about_me = Faker::Lorem.sentences(3)
    gender = ["female", "male"].sample
    User.find_or_create_by(
    email: email,
    password: password,
    username: username,
    about_me: about_me,
    gender: gender
    )
  end

  20.times do |n|
    skill_id = skill1.id
    user_id = n
    HadSkill.find_or_create_by(
    skill_id: skill_id,
    user_id: user_id
    )
  end

  20.times do |n|
    skill_id = skill2.id
    user_id = n + 20
    WantedSkill.find_or_create_by(
    skill_id: skill_id,
    user_id: user_id
    )
  end
