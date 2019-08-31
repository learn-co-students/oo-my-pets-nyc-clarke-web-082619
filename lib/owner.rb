class Owner
  attr_reader :name, :species

  @@all = []


  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
    @@count = []
  end

  def cats
    Cat.all.select {|x| x.owner == self}
  end

  def dogs
    Dog.all.select {|x| x.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    
  end

  def walk_dogs
    self.dogs.each {|x| x.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|x| x.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |x|
      x.mood = "nervous"
      x.owner = nil
    end
  end
  
  def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end