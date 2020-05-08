require 'pry'

class Artist 
  
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    if !songs.include?(song)
      @songs << song 
    end 
    if !song.artist
      song.artist = self 
    end
  end
  
  def genres 
    unique_genres = []
    songs.each do |song|
      if !unique_genres.include?(song.genre)
        unique_genres << song.genre
      end
    end
    unique_genres
  end 
  
  
end