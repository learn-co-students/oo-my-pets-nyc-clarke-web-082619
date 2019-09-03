class Owner
  
  attr_reader :name, :species

  @@all = [] 

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end 

  def say_species 
    "I am a #{@species}."
  end 
  
  def self.all 
    @@all 
  end 

  def self.count 
    Owner.all.length 
  end 

  def self.reset_all 
    Owner.all.clear
  end 

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self} 
  end 

  def buy_cat(name)
    Cat.new(name,self)
  end 

  def buy_dog(name)
    Dog.new(name,self)
  end 

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets 
    dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil 
    end 

    cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end 
  end

  def list_pets 
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end