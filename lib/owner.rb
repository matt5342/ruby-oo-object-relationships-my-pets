require 'pry'
require 'cat.rb'
class Owner
  @@all = []
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    save
  end
  def cats
    Cat.all.select {|instance| instance.owner == self}
  end
  def dogs
    Dog.all.select {|instance| instance.owner == self}
  end
  def buy_cat(cat_1)
    Cat.new(cat_1, self)
  end
  def buy_dog(dog_1)
    Dog.new(dog_1, self)
  end
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end




  def say_species
    "I am a #{@species}."
  end
  def save 
    @@all.push(self)
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