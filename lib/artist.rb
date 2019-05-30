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
    if @songs.include?(song)
      @artist.name
    else 
      @songs << song
    end
  end
end