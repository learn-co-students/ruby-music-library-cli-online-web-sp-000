require_relative './concerns/Findable.rb'

class Genre 
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable 
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
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre 
  end 
  def artists 
    songs.map {|song| song.artist}.uniq  
  end 
end 