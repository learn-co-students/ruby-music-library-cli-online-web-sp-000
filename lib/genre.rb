require_relative '../lib/concerns/Findable.rb'
class Genre
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
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    if(!@songs.include?(song))
    @songs<< song
  end
    if(!song.genre)
    song.genre = self
  end
  end
  
  def songs
    @songs
  end
  def self.create(name)
    genre=self.new(name)
    genre.save
    genre
  end
  
  def artists
    Song.all.collect{|song| song.artist}.uniq
  end
end