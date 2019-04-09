require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genres
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
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end
  
  #adds song to instance's list of songs
  #associates the song's artist to self
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end
  
  #finds genres of artist instance through artist's songs
  def genres
    no_dup = []
    @songs.each {|song| no_dup << song.genre if !no_dup.include?(song.genre)}
    no_dup
    
    
  end
end