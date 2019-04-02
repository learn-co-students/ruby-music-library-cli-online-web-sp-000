require_relative '../lib/concerns/Findable.rb'
class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all=[]
  
  def initialize(name)
    @name=name
    @songs=[]
    
  end
  
  def save
    @@all<< self
  end
  
  def songs
    @songs
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist=self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if(!@songs.include?(song))
    @songs<< song
  end
    if(!song.artist)
    song.artist = self
  end
  end
  
  def genres
    Song.all.collect{|song| song.genre}.uniq
  end
  
end
