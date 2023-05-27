require "./remover.rb"
require "./foods.rb"

# Class definition
class Animal
  attr_accessor :owner, :visits

  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
    @liked_food = NoFood.new() # composition
    @visits = []
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

  def owner=(owner)
    @owner = owner
    owner.animals.push(self) unless owner.animals.include?(self)
  end
end
