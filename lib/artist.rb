require 'pry'

class Artist
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name
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
  
  def add_song(song)
    song.artist = self
  end
  
  def genres
    songs_artist = Song.all.select{|song| song.artist == self}
    songs_artist.map{|song| song.genre}
  end
end