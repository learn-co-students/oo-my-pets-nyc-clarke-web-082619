class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []
  

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
   cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog| dog.owner == self 
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat| cat.owner == self 
      cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.select do |dog| dog.owner == self 
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.select do |cat| cat.owner == self 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end


end