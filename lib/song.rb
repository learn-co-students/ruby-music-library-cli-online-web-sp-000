class Song 
  
  attr_accessor :name, :artist  
  
  @@all = []
  
  def initialize(name, artist=nil)
    @name = name 
    self.artist = artist
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.create(name)
    song = self.new(name)
    song.save 
    song  
  end 
  
  def save 
    @@all << self 
  end 
  
  def artist=(artist)
    #@artist = artist 
    artist.add_song(self)
  end 
  
end 