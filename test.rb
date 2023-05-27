require "./animal.rb"
require "./dog.rb"
require "./spider.rb"
require "./owner.rb"
require "./visit.rb"
require "./vet.rb"

# object instansation
animal_1 = Animal.new("dog", 4, "Rex")

# access instance varible with getter
puts animal_1.id
puts animal_1.type
puts animal_1.name
puts animal_1.number_of_legs
puts

# another object instansation
animal_2 = Animal.new("cat", 8)
puts animal_2.name
puts animal_2.name = "Fluffy" # set instance varibale with setter method
puts animal_2.name
puts

# using a composed method
animal = Animal.new("lion", 4, "Rex")
dog = Dog.new("black", "Rex")
spider = Spider.new(85, "Wilma")

puts animal.number_of_legs
puts dog.number_of_legs
puts spider.number_of_legs

puts animal.remove_leg()
puts dog.remove_leg()
puts spider.remove_leg()
puts

animal.number_of_legs
dog.number_of_legs
spider.number_of_legs

puts
puts animal.likes_food?("meat")
puts dog.likes_food?("meat")
puts spider.likes_food?("meat")
puts 

puts animal.likes_food?("bug")
puts dog.likes_food?("bug")
puts spider.likes_food?("bug")

# Association, aggregation, and composition
alex = Owner.new("Alex") # object instansation

puts
alex.animals
alex.add_animal(dog) # association - owner has a dog 1 to *
alex.animals
alex.add_animal(spider) # association - owner has a spider 1 to *
alex.animals

alex.add_animal(animal) # association - owner has a animal 1 to *
puts alex.animals.map {|animal| animal.name}

puts "Animal count: #{alex.animals.count}"
puts "Name of First Animal: #{alex.animals.first.name}"
puts "Leg of First Animal: #{alex.animals.first.number_of_legs}"

# Both ways relationships
puts
dog.owner
alex.add_animal(dog)
dog.owner
puts dog.owner.name
alex.animals

spider.owner
alex.add_animal(spider)
spider.owner
puts spider.owner.name
alex.animals

animal.owner
alex.add_animal(animal)
animal.owner
puts animal.owner.name

alex.animals.count
alex.animals.first.name
alex.animals.first.number_of_legs

second_animal = Animal.new("cat", 4, "Kitty")
second_animal.owner
alex.animals.count

second_animal.owner = alex

second_animal.owner
alex.animals.count
alex.animals.last
alex.animals.last.name

# Many-to-many relationship
vet_maria = Vet.new("Maria", "New York")
vet_john = Vet.new("John", "San Francisco")

visit_1 = Visit.new("2017-12-22", dog, vet_maria)
visit_2 = Visit.new("2017-12-31", dog, vet_maria)

dog.visits.count
dog.visits.map { |visit| visit.date }

vet_john.visits.count
vet_maria.visits.count

vet_maria.visits.map { |visit| visit.animal.name }

visit_3 = Visit.new("2017-11-11", spider, vet_john)
visit_4 = Visit.new("2017-10-10", spider, vet_maria)

spider.visits.count
spider.visits.map { |visit| visit.date }
vet_john.visits.count
vet_john.visits.map { |visit| visit.animal.name }
vet_maria.visits.count
vet_maria.visits.map { |visit| visit.animal.name }
