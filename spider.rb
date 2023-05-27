require "./animal.rb"
require "./foods.rb"

class Spider < Animal
  def initialize(web_strength_level, name = "Unknown")
    super("spider", 8, name)
    @web_strength_level = web_strength_level
    @liked_food = SpiderFood.new() # composition
  end

  def make_a_web
    "www"
  end

  def speak
    "..."
  end
end

# create a dog object and access public method
spider = Spider.new(85, "Wilma")
spider.make_a_web()

# Polymorphism - speak() method in multiple form
animal = Animal.new("lion", 4, "Rex")
spider = Spider.new(85, "Wilma")

animal.speak()
spider.speak()
