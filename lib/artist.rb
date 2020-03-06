require 'pry'
class Artist
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
  end
  
  def self.create(artist)
    artist = Artist.new(artist)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist == nil ?  song.artist = self : nil
    @songs.include?(song) ? nil :  @songs << song
    song
  end
  
  def genres
    genres_collection = Array.new
    @songs.each do |song|
      unless genres_collection.include?(song.genre)
        genres_collection << song.genre
      end
    end
    genres_collection
  end
  
end