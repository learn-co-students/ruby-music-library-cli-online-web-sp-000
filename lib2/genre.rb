require 'pry'


class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    new_object = self.new(name)
    new_object.save
    new_object
  end
  
  def add_song(song)
    song.genre = self if song.genre == nil
    songs << song if songs.include?(song) != true
  end
  
  def artists
    genres_artists = Song.all.select{|song| song.genre == self}
    artists = []
    genres_artists.map {|song| artists << song.artist if artists.include?(song.artist) != true }
    artists
  end
  
end