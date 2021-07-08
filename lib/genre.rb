require 'concerns/findable'

class Genre 
  extend Concerns::Findable 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def songs 
    @songs 
  end 
  
  
  def artists
    list_artists = []
    @songs.collect do |song| 
      if song.genre == self
                list_artists << song.artist       
      end
    end 
    list_artists.uniq
  end
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new_genre = Genre.new(name)
  end 
  
  
end 