require 'pry'
class Genre
  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @genre = self.new(name)
    @genre.name = name
    @genre.save
    @genre
  end
end