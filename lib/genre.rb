require 'pry'


class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def add_song(song)
    song.genre = self if song.artist == nil
    songs << song if songs.include?(song) == false
  end
  
  def add_songs
    genres_songs = Song.all.select{|song| song.genre == self}
    genres_songs.map {|song| songs << song if songs.include?(song) == false}
  end
  
  def songs
    add_songs
    @songs
  end
  
  def artists
    genres_artists = Song.all.select{|song| song.genre == self}
    artists = []
    genres_artists.map {|song| artists << song.artist if artists.include?(song.artist) == false}
    artists
  end
  
end