require_relative './concerns.rb'
class Genre 
   extend Concerns::Findable
   
  attr_accessor :name
  attr_reader :songs
 
  @@all = []
 
  def initialize(name)
   @name = name
   @songs = []
  end
  
  def artists
    self.songs.collect { |song| song.artist }.uniq
  end
 
  def self.all
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end
 
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end