require 'pry'
class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
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
    # binding.pry
  end
  
  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end
  
  def artists
    artists_collection = Array.new
    
    songs.each do |song|
      unless artists_collection.include?(song.artist)
        artists_collection << song.artist
      end
    end
    artists_collection
  end
  
end