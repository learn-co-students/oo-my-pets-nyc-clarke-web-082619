class Owner
  attr_reader :name, :species
  attr_accessor :mood
  @@all = []
  @@count = 0
  
  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
    @@count += 1
  end

  def say_species
    return "I am a #{self.species}."
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name)
    cat.owner = self
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    dog.owner = self
  end

  def walk_dogs
    dogs = Dog.all.select {|dog| dog.owner == self}
    dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    cats = Cat.all.select {|cat| cat.owner == self}
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    pets = self.dogs + self.cats
    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pet| pet.owner = nil}
    pets.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0 
  end

end