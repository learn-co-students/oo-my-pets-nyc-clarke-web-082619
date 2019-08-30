require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species, :cats
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species 
    "I am a #{species}."
  end

  def cats 
     Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    #Cat.all.find {|cat| cat.name == cat_name}.owner == self
    Cat.new(cat_name, self)
    #binding.pry
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = self.dogs + self.cats

    all_pets.each do |pets|
      pets.mood = "nervous"
      pets.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end


  
end