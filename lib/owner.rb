class Owner
  attr_reader :name, :species 
  attr_accessor :cats, :dogs
  @@owners = []
  def initialize(name)
    @name = name
    @species = 'human'
    @@owners << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@owners
  end

  def self.count
    self.all.count 
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    @cats << Cat.new(name, self)
  end

   def buy_dog(name)
    @dogs << Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map!{|dog| dog.mood = 'happy'}
  end

  def feed_cats
     self.cats.map!{|cat| cat.mood = 'happy'}
  end

  def sell_pets
  self.cats.map!{|cat| cat.mood = 'nervous'}
  self.cats.map!{|cat| cat.owner = nil}
  self.dogs.map!{|dog| dog.mood = 'nervous'}
  self.dogs.map!{|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
  end
end