require 'pry'
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = artist)
    @name = name
    @artist = artist
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
    @song = self.new(name)
    @song.name = name
    @song.save
    @song
  end
end