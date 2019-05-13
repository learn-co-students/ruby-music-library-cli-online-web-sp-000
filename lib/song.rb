require 'pry' 
class Song 
  
  attr_accessor :name, :genre  
  attr_reader :artist  
  
  @@all = [] 
  
  def initialize(name, artist= nil)
    @name = name 
    self.artist = artist if artist
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end 
  
  def artist=(artist)
   @artist = artist
   artist.add_song(self)
  end
                  
end 