# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

# Begin:Two users that would create a match
    skill1 = Skill.create(name: "Japanese", category: "Language" , description: "A language spoken in Japan" , url: "http://en.wikipedia.org/wiki/Japanese_language")
    skill2 = Skill.create(name: "Ruby", category: "Programming Languages" , description: "A elegant and syntatically clear programming language." , url: "http://en.wikipedia.org/wiki/Japanese_language")
    us1 = HaveSkill.create(skill_id: 1, user_id: 1, expertise_level: "Novice")
    us2 = WantSkill.create(skill_id: 2, user_id: 1)
    u1 = User.create(username: "fakeuser1" , email: "fakeusersemail1@user.com", password: "fakepass", gender: "male", about_me: "I may be fake but I still wish i could learn skills for free!")

    us3 = HaveSkill.create(skill_id: 1, user_id: 2, expertise_level: "Novice")
    us4 = WantSkill.create(skill_id: 2, user_id: 2)
    u2 = User.create(username: "fakeuser2" , email: "fakeusersemail2@user.com", password: "fakepass", gender: "male", about_me: "I may be fake but I still wish i could learn skills for free!")
# End:Two users that would create a match


  #  create_table "skills", force: :cascade do |t|
  #    t.string   "name",        null: false
  #    t.string   "category",    null: false
  #    t.string   "description"
  #    t.string   "url"
  #    t.datetime "created_at"
  #    t.datetime "updated_at"
  #  end
  #
  #  create_table "UserSkills", force: :cascade do |t|
  #    t.integer  "skill_id",        null: false
  #    t.integer  "user_id",         null: false
  #    t.string   "have_or_want",    null: false
  #    t.string   "expertise_level"
  #    t.datetime "created_at"
  #    t.datetime "updated_at"
  #  end
