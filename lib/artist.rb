require_relative './concerns/Findable.rb'

class Artist 
  attr_accessor :name, :songs, :genres 
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
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist 
  end 
  def add_song(song)
    if(!song.artist)
      song.artist = self
      self.songs << song 
    end 
  end 
  def genres 
    Song.all.select {|song| song.artist == self}
  end 
end 