class Dog
  attr_reader :name
  attr_accessor :owner, :mood


  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @@all << self
    @mood = "nervous"
  end

  def mood
    @mood
  end

  def self.all
    @@all
  end




end