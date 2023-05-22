# Class definition
class Animal
  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
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
