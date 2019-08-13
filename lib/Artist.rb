require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize (name)
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
    self.all.clear
  end

  def self.create (name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song (song)
    song.artist ||= self
    self.songs << song if !self.songs.include?(song)
  end
  
  def genres
    self.songs.map {|song| song.genre}.uniq
  end
  
end
