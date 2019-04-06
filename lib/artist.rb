require_relative '../lib/concerns/Findable.rb'
class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
    
  end
  
  def self.all
    @@all
  end
  
  def save
     @@all<< self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist=Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if(!song.artist)
      song.artist=self
      @songs<< song
    end
  end
  
  def genres
    Song.all.collect{|i| i.genre}.uniq
  end
   
end
