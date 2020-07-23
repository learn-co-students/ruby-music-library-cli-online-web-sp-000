require 'pry'


class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :song
  
  attr_reader :songs
  
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

  def self.create(name)
    new_object = self.new(name)
    new_object.save
    new_object
  end
  
  def save 
    @@all << self
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    songs << song if songs.include?(song) != true
  end

  def genres
    genres_artists = Song.all.select{|song| song.artist == self}
    genres = []
    genres_artists.map {|song| genres << song.genre if genres.include?(song.genre) != true }
    genres
  end
  
end