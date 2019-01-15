require 'pry'


class Artist 
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
  
  def songs 
    @songs
  end
  
  def add_song(song)
    song.artist = self 
    @songs << song
  end
  
  
  
  
end
