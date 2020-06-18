require 'pry'

class Artist 
  
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
  
  def add_song(song)
    if !song.artist
    song.artist = self
    self.songs << song
  end
  end
  
  def artists_songs 
    Song.all.select {|song| song.artist == self} 
  end

  def genres 
    artists_songs.map {|song| song.genre}.uniq
  end
end