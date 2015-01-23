# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
e_pass = ENV["E_PASS"]
u1 =
User.find_or_create_by(username: "fakeuser1",
                            email: "fakeusersemail1@user.com",
                            encrypted_password: e_pass,
                            gender: "male",
                            about_me: "I may be fake but I still wish" +
                                      "i could learn skills for free!")
u2 =
User.find_or_create_by(username: "fakeuser2",
                            email: "fakeusersemail2@user.com",
                            encrypted_password: e_pass,
                            gender: "male",
                            about_me: "I may be fake but I still wish i could" +
                                      "learn skills for free!")
skill1 =
Skill.find_or_create_by(name: "Japanese",
                          category: "Language",
                          description: "A language spoken in Japan",
                          url: "http://en.wikipedia.org/wiki/Japanese_language")
skill2 =
Skill.find_or_create_by(name: "Ruby",
                        category: "Programming Languages" ,
                        description: "A elegant and syntatically clear programming language.",
                        url: "http://en.wikipedia.org/wiki/Ruby_(programming_language)")

skill_java =
Skill.find_or_create_by(name: "Java",
                        category: "Programming Languages",
                        description: "",
                        url: "http://en.wikipedia.org/wiki/Java")

skill_go =
Skill.find_or_create_by(name: "GO Language",
                        category: "Programming Languages",
                        description: "",
                        url: "http://en.wikipedia.org/wiki/Go_(programming_language)")

skill_javascript =
Skill.find_or_create_by(name: "Javascript",
                        category: "Programming Languages",
                        description: "JavaScript is a dynamic computer programming" +
                        "language.[5] It is most commonly used as part of web browsers," +
                        "whose implementations allow client-side scripts to interact" +
                        "with the user, control the browser, communicate asynchronously" +
                        "and alter the document content that is displayed.",
                        url: "http://en.wikipedia.org/wiki/JavaScript")
skill_haskell =
Skill.find_or_create_by(name: "Haskell",
                        category: "Programming Languages",
                        description: "Haskell is a standardized, general-purpose" +
                        "purely functional programming language, with non-strict" +
                        "semantics and strong static typing. It is named after" +
                        "logician Haskell Curry.",
                        url: "http://en.wikipedia.org/wiki/Haskell_(programming_language)")
Skill.find_or_create_by(name: "C++", category: "Programming Languages" )
Skill.find_or_create_by(name: "C", category: "Programming Languages")
Skill.find_or_create_by(name: "Objective C", category: "Programming Languages")
Skill.find_or_create_by(name: "Objective C", category: "Programming Languages")
Skill.find_or_create_by(name: "PhP", category: "Programming Languages")
Skill.find_or_create_by(name: ".N", category: "Programming Languages")


# winter sports
skill_winter1 =
Skill.find_or_create_by(name: "Snowboarding",
                        category: "Winter Sports",
                        description: "A winter sport where a rider slides down a mountain on a board",
                        url: "http://en.wikipedia.org/wiki/Snowboarding")

skill_winter2 =
Skill.find_or_create_by(name: "Snowshoeing",
                        category: "Winter Sports" ,
                        description: "",
                        url: "http://en.wikipedia.org/wiki/Snowshoe")

skill_winter3 =
Skill.find_or_create_by(name: "Dog Mushing",
                        category: "Winter Sports" ,
                        description: "Dogs pull humans on a sled.",
                        url: "http://en.wikipedia.org/wiki/Mushing")
    # us1 = HadSkill.find_or_create_by(skill_id: skill1.id,
    #                                 user_id: u1.id,
    #                                 expertise_level: "Novice")
    # us2 = HadSkill.find_or_create_by(skill_id: skill1.id,
    #                                 user_id: u1.id)
    # us3 = HadSkill.find_or_create_by(skill_id: skill2.id,
    #                                 user_id: u2.id,
    #                                 expertise_level: "Novice")
    # us4 = HadSkill.find_or_create_by(skill_id: skill2.id,
    #                                 user_id: u2.id)
# End:Two users that would create a match

  Category.find_or_create_by(name: "Technology")
  Category.find_or_create_by(name: "Fitness")
  Category.find_or_create_by(name: "Art")
  Category.find_or_create_by(name: "Language")
  Category.find_or_create_by(name: "Programming languages")
  Category.find_or_create_by(name: "Winter Sports")

  # create users
  350.times do |n|
    username = Faker::Internet.user_name
    email = "#{username}@gmail.com"
    pass = "fakeusers"
    about_me = Faker::Lorem.sentences(3)
    gender = ["female", "male"].sample
    address = ["Boston,MA", "NYC, NY",
              "Kansas City, Kansas", "Moscow,
              Russia", "Rochester, NY", "Concord, MA"].sample
    User.create(email: email,
    password: pass,
    username: username,
    about_me: about_me,
    gender: gender,
    address: address
    )
    sleep(1)
  end

  28.times do
    user = User.all.sample
    Skills.each do |skill|
      HadSkill.find_or_create_by(
      skill_id: skill.id,
      user_id: user.id
      )
      WantedSkill.find_or_create_by(
      skill_id: skill.id,
      user_id: user.id
      )
    end
  end

  # create 20 matches
  1.upto(20) do |n|
    HadSkill.find_or_create_by(
    skill_id: skill1.id,
    user_id: n
    )
    WantedSkill.find_or_create_by(
    skill_id: skill2.id,
    user_id: n
    )
    n += 1
  end

  21.upto(40) do |n|
    HadSkill.find_or_create_by(
    skill_id: skill2.id,
    user_id: n
    )
    WantedSkill.find_or_create_by(
    skill_id: skill1.id,
    user_id: n
    )
    n += 1
  end
