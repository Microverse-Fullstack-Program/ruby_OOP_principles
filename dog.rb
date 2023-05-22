require "./animal.rb"

class Dog < Animal
  def initialize(color, name = "Unknown")
    super("dog", 4, name)
    @color = color
  end

  def bring_a_stick
    "Here is your stick: ---------"
  end

  def speak
    "Woof, woof"
  end
end

# create a dog object and access public method
dog = Dog.new("black", "Rex")
dog.bring_a_stick()
dog.make_a_web()

# Polymorphism - speak() method in multiple form
animal = Animal.new("lion", 4, "Rex")
dog = Dog.new("black", "Rex")

animal.speak()
dog.speak()
