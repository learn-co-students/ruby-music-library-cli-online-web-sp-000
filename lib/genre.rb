require 'pry'

class Genre 
  
  attr_accessor :name, :songs
  
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
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save 
    genre
  end
  
  def genres_songs 
    Song.all.select {|song| song.genre == self}
  end 
  
  def artists 
    genres_songs.map {|song| song.artist}.uniq
  end
end