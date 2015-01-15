module ApplicationHelper
  def get_categories
    ["Technology", "Art", "Fitness", "Hiking"]
  end

  def get_skill_levels
    ["Beginner", "Intermediate", "Advanced"]
  end

  def titleize(string)
    lowercase_words = %w{a an the and but or for nor of}
    name.split.each_with_index.map{|x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
  end
end
