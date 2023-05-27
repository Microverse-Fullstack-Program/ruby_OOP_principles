require "./remover.rb"
require "./foods.rb"

# Class definition
class Animal
  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
    @liked_food = NoFood.new() # composition
  end

  # Encapsulation: binding data to method and 
  # access or set value through setter and getter
  # getter examples
  def id
    @id
  end

  def type
    @type
  end

  def number_of_legs
    @number_of_legs
  end

  def name
    @name
  end

  # setter methods
  def name=(value)
    @name = value
  end

  # abstraction 
  def speak
    "grrrr"
  end

  # composition
  def remove_leg
    remover = Remover.new() 
    @number_of_legs = remover.decrease(@number_of_legs) # delegation - composed method
  end

  def likes_food?(food)
    @liked_food.is_liked?(food) # delegation - composed method
  end
end

# object instansation
animal_1 = Animal.new("dog", 4, "Rex")

# access instance varible with getter
animal_1.id
animal_1.type
animal_1.name
animal_1.number_of_legs

# another object instansation
animal_2 = Animal.new("cat", 8)
animal_2.name
animal_2.name = "Fluffy" # set instance varibale with setter method
animal_2.name

# using a composed method
animal = Animal.new("lion", 4, "Rex")
dog = Dog.new("black", "Rex")
spider = Spider.new(85, "Wilma")

animal.number_of_legs
dog.number_of_legs
spider.number_of_legs

animal.remove_leg()
dog.remove_leg()
spider.remove_leg()

animal.number_of_legs
dog.number_of_legs
spider.number_of_legs


animal.likes_food?("meat")
dog.likes_food?("meat")
spider.likes_food?("meat")

animal.likes_food?("bug")
dog.likes_food?("bug")
spider.likes_food?("bug")
