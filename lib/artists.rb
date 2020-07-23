require "pry"

class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
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
    song = self.new(name)
    song.save
    song
  end
  
  def songs
    @songs
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
    gen_list = self.songs.collect do |song|
      song.genre
    end
    gen_list.uniq
  end
  
  
end