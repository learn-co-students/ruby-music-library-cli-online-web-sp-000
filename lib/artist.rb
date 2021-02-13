require "pry"

class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
    
  end 
  
  def self.all 
  @@all 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(artist_name)
    artist = Artist.new(artist_name) 
    artist.save
    artist
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
   if song.artist
     song.artist
   else 
     song.artist = self
  end 
  if @songs.include?(song)
    song
  else
  @songs << song
end
end

def genres 
  binding.pry
  Song.all.select do |song|
    
 if song.artist == self.name
   song.genre 
   
  end 
  end
  end
  
end 