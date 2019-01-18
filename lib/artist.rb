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
    songs = Song.all
  
    songs.select do |s|
      s.artist == self
    end
    
  end
  
  def add_song(song)
    song.artist = self 
    @songs << song
  end
  
  def genres 
    
    collection = []
  songs.map do |song|
    collection << song.genre
  end
  collection.uniq 
    
  end
 
  
end
