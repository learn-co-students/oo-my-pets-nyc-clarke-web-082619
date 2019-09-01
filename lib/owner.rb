class Owner
  attr_reader :name, :species
  attr_accessor  
  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end 

  def say_species
    "I am a #{self.species}."
  end 

  def cats
    Cat.all.select {|cats| cats.owner == self }
  end 
  
  def dogs
    Dog.all.select {|dogs| dogs.owner == self }
  end 
  
  def buy_cat(name)
    Cat.new(name, self)
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    pets = [] 
    pets << dogs
    pets << cats 
    # Cat.all.collect {|cats| pets << cats if cats.owner == self}
    # Dog.all.collect {|dogs| pets << dogs if dogs.owner == self }
    pets.flatten.map {|pets| pets.mood = "nervous" }
    pets.flatten.map { |pets| pets.owner = nil }
  end 

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
  
  def self.all
    @@all
  end 

  def self.count
    self.all.count 
  end 

  def self.reset_all
    self.all.clear 
  end 

end 