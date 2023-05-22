# OOP four principles by example

## What are we building?

We are going to build some classes to represent animals. Initially, we are going to make some naive code and then we'll improve it by using the OOP principles.

While reading this article, create your files with classes and try some code in your IRB console. Keep the files you create saved for upcoming lessons.

## Let's get building

First, make sure you have the code from the previous article [Class vs object: examples](class_and_object_for_irb.md). You should have a file named `animal.rb` with a single class `Animal`.

In your `Animal` class add a `type` parameter and assign it to the `@type` instance variable. It should look like this:

```ruby
class Animal
  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
  end
end
```

### Encapsulation

If you try the previous code in IRB you will see that you can't access or modify any of the attributes in either class. This is due to Ruby's encapsulation. Because of this encapsulation the instance variable can't be accessed outside the object, only by methods inside of it.

But then how do you interact with an object? Well, you declare public methods. By default in Ruby any method declared is public (can be called anywhere), but you can also declare them as private (can only be called inside that class).

So, we could create a public method to fetch `@name`'s value and another one to modify it. These types of methods are called **getter** (get a value) and **setter** (set a value) methods. The getter is called the same as the corresponding instance variable and the setter is called the same, but it should be followed by `=` (this is Ruby's special syntax for setters).

Now that you have a better understanding, let's add some getters and setters so we can interact with the attributes. In `animal.rb` modify `Animal` by adding the following:

```ruby
class Animal
  ...

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

  def name=(value)
    @name = value
  end
end
```

Great! now we can access `Animal`'s attributes and modify `name` if needed.

<details>
<summary>Try it out in your IRB console</summary>

```ruby
require "./animal.rb"

animal_1 = Animal.new("dog", 4, "Rex")
animal_1.id
animal_1.type
animal_1.name
animal_1.number_of_legs

animal_2 = Animal.new("cat", 8)
animal_2.name
animal_2.name = "Fluffy"
animal_2.name
```

</details>

#### Useful shortcuts: attr_reader, attr_writer, and attr_accessor

Ruby offers you a nice way to create your getters and setters!

Instead of writing two methods to get and set a name:

```ruby
  def name
    @name
  end

  def name=(value)
    @name = value
  end
```

You can declare them by using:

```ruby
attr_reader :name
attr_writer :name 
```

Or you can make it even shorter by using:

```ruby
attr_accessor :name
```

Of course if you need only a getter method you will use only `attr_reader`. Likewise, if you need only a setter method, you will use only `attr_writer`.


### Abstraction

Next, we want to see our animals speak (return a string) depending on their type. If we didn't have abstractions we would have to make a method that checks the instance's class and gives the string depending on that. Something like this:

```ruby
def speak(animal)
  if animal.type == "dog"
    "Woof, woof"
  elsif animal.type == "spider"
    "..."
  end
end
```

This implementation of `speak` depends on internal knowledge of the instance - in this case knowing that it has an attribute `type` and that it has those values. This presents the following problems:
- Have to maintain `type`, and if it changes or is removed this method will break.
- To add a new animal we need to also add another `elsif`.
- This code might be repeated across different parts of our source code without us noticing.

To make this code better we can leverage abstractions and instead of having a method using internals we have a public method that uses those same internals. The main difference is that if we eventually want to change the internals of `Animal` we only need to update the `speak` method, the same to add a new animal type. So, let's update the `speak` method as follows:

```ruby
class Animal
  ...

  def speak
    if @type == "dog"
      "Woof, woof"
    elsif @type == "spider"
      "..."
    end
  end

  ...
end
```

<details>
<summary>Try it out in your IRB console</summary>

```ruby
require "./animal.rb"

animal_1 = Animal.new("dog", 4, "Rex")
animal_2 = Animal.new("spider", 8, "Wilma")

animal_1.speak()
animal_2.speak()
```

</details>

### Inheritance

So next we got a request for some specific functionality when the animal is of a certain type:
- If a dog we want to be able to `bring_a_stick`.
- If a spider we want to be able to `make_a_web`.

This would look something like this:

```ruby
class Animal
  ...

  def bring_a_stick
    if @type == "dog"
      "Here is your stick: ---------"
    end
  end

  def make_a_web
    if @type == "spider"
      "www"
    end
  end
end
```

<details>
<summary>Try it out in your IRB console</summary>

```ruby
require "./animal.rb"

animal_dog = Animal.new("dog", 4, "Rex")
animal_spider = Animal.new("spider", 8, "Wilma")

animal_dog.bring_a_stick()
animal_spider.bring_a_stick()

animal_dog.make_a_web()
animal_spider.make_a_web()
```

</details>

If you test these methods out you'll notice that the method that is not for the current animal still exists, it just returns `nil`. You might think this is not that bad, but in reality it can be bad because that `nil` value can be passed through your entire codebase, end up in a place where it is not valid and causes an exception, and you might not be able to easily figure out where that value came from.

So, how can we improve this? Inheritance. We can make classes (`Dog` and `Spider`) that inherit from our `Animal` class and add the specific methods we want for them. Also, we can go a step further and set `@number_of_legs` in `initialize` and some specific attributes for each.

Remove the `bring_a_stick` and `make_a_web` methods from your `Animal` class.

Create a `dog.rb` file with the class `Dog` as follows:

```ruby
require "./animal.rb"

class Dog < Animal
  def initialize(color, name = "Unknown")
    super("dog", 4, name)
    @color = color
  end

  def bring_a_stick
    "Here is your stick: ---------"
  end
end
```

Create a `spider.rb` file with the class `Spider` as follows:

```ruby
require "./animal.rb"

class Spider < Animal
  def initialize(web_strength_level, name = "Unknown")
    super("spider", 8, name)
    @web_strength_level = web_strength_level
  end

  def make_a_web
    "www"
  end
end
```

Now if you try the `bring_a_stick` or `make_a_web` methods in the incorrect class instance you'll get an exception and they are a bit simpler each.

<details>
<summary>Try it out in your IRB console</summary>

```ruby
require "./dog.rb"
require "./spider.rb"

dog = Dog.new("black", "Rex")
spider = Spider.new(85, "Wilma")

dog.bring_a_stick()
spider.bring_a_stick()

dog.make_a_web()
spider.make_a_web()
```
  
</details>

### Polymorphism

Now that we have specific classes for `Dog` and `Spider` how about we use that and a bit of the magic of polymorphism to refactor the code for `speak`. In this new version, we can have some generic text (`"grrrr"`) for animals and a specific one for specific animals.

Modify `speak` in `Animal` to return `"grrrr"`

```ruby
class Animal
  ...

  def speak
    "grrrr"
  end

  ...
end
```

Add a `speak` method in `Dog` that returns `"Woof, woof"`

```ruby
class Dog < Animal
  ...

  def speak
    "Woof, woof"
  end
end
```

Add a `speak` method in `Spider` that returns `"..."`

```ruby

class Spider < Animal
  ...

  def speak
    "..."
  end
end
```

<details>
<summary>Try it out in your IRB console</summary>

```ruby
require "./animal.rb"
require "./dog.rb"
require "./spider.rb"

animal = Animal.new("lion", 4, "Rex")
dog = Dog.new("black", "Rex")
spider = Spider.new(85, "Wilma")

animal.speak()
dog.speak()
spider.speak()
```
</details>

------

_If you spot any bugs or issues in this activity, you can [open an issue with your proposed change](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/open_issue.md)._
