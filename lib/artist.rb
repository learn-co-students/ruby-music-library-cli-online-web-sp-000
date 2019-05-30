require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @artist = self.new(name)
    @artist.name = name
    @artist.save
    @artist
  end
  
  def self.songs
    @@all
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
    if @artist 
      artist.name
  end
end