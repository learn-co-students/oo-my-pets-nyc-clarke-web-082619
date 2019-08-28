class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def cats
    Cat.all.select{|x| x.owner == self}
  end

  def dogs
    Dog.all.select{|x| x.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    dogs.each{|x| x.mood = "happy"}
  end

  def feed_cats
    cats.each{|x| x.mood = "happy"}
  end

  def sell_pets
    dogs.each{|x| 
    x.mood = "nervous" 
    x.owner = nil
    }

    cats.each {|x| 
    x.mood = "nervous" 
    x.owner = nil
    }
  end

  def list_pets
    return "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end


end