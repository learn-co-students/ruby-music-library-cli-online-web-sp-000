require 'pry'

class Genre
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def songs
    songs_genre = Song.all.select{|song| 
      if song.genre == self
        @songs << song
      end
      song.genre == self}
      songs_genre
  end
  
  def artists
    songs_genre = Song.all.select{|song| song.genre == self}
    songs_genre.map{|song| song.artist}
  end
end