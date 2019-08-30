require "pry"
class Owner
  attr_reader :name, :species, :cats, :dogs
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a #{self.species}."
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
  def buy_cat(name)
    Cat.new(name, self)
  end


  def buy_dog(name)
    Dog.new(name, self)
  end


  def walk_dogs 
    dogs.map do |dog| 
      dog.mood = "happy"
      dog
    end
  end

    def cats
      Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def feed_cats
      cats.map do |cat| 
        cat.mood = "happy"
        cat
      end
    end
    def list_pets
      "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
    end

    def sell_pets
      remove_owner_and_make_nervous(cats)
      remove_owner_and_make_nervous(dogs)
    end

    def remove_owner_and_make_nervous(pets)
      pets.map do |pet|
        pet.owner = nil
        pet.mood = "nervous"
      end
      pets.clear
    end

    # def cats
    #   Cat.all.select {|cat| cat.owner == self}
    # end

    # def dogs
    #   Cat.all.select {|cat| cat.owner == self}
    # end

end

