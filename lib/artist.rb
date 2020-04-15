require 'pry'

class Artist
  
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

end