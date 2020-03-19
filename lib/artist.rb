

class Artist 
  attr_accessor :name, :song, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
  @@all = []
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
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap do|artist|
      artist.save
    end
  end
  
  def songs 
    @songs 
  end
  
 def add_song(song)
    song.artist = self if song.artist != self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end

    
  
end