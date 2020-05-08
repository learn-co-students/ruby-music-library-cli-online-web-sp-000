require 'pry'

class Genre 
  
  extend Concerns::Findable 
  
  attr_accessor :name
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
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end
  
 def add_song(song)
    if !songs.include?(song)
      @songs << song 
    end 
    if !song.genre
      song.genre = self 
    end
  end
  
    def artists
    unique_artists = []
    songs.each do |song|
      if !unique_artists.include?(song.artist)
        unique_artists << song.artist
      end
    end
    unique_artists
  end 
  
  
  
end