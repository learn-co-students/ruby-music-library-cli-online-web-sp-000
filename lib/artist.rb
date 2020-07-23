require 'pry'


class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :song
  
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    songs << song if songs.include?(song) == false
  end
  
  def songs
    @songs
  end

  def genres
    genres = []
    artists_songs = Song.all.select{|song| song.artist == self}
    artists_songs.map{|song| genres << song.genre if genres.include?(song.genre) == false}
    genres
  end
  
end