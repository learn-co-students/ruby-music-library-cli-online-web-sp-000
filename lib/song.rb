require 'pry'

class Song 
  attr_accessor :name, :artist
  attr_reader :genre 
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @artist = artist
    self.genre=(genre) unless genre == nil
    @@all << self 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
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
    song = self.new(name)
    song.save 
    self
  end
  

end 