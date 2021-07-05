require 'pry'
class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
  
   def artists
    songs.collect { |s| s.artist}.uniq
  end 
end