require 'concerns/findable'

class Artist 
  extend Concerns::Findable 

  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def songs 
    @songs 
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
    new_artist = Artist.new(name)
  end 
  
  def add_song(song)
    if song.artist == nil  
      song.artist = self
    end 

    if !@songs.include?(song)
        @songs << song 
    end 
  end 
    
  def genres 
    list_genres = []
    @songs.collect do |song| 
      if song.artist == self
          list_genres << song.genre    
      end
    end 
    list_genres.uniq
  end


   
      
 
  
    
end 


