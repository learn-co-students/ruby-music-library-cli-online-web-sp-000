

class Artist  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name= name
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
  
  def self.create(thing)
    self.new(thing).tap do |artist|
    artist.save
  end
end
 
 def songs 
    @songs 
  end
  
  def add_song(song)
    if song.artist == self 
    self.songs << song unless self.songs.include?(song) 
  else 
    song.artist = self 
    self.songs << song unless self.songs.include?(song)
  end
end

def genres
  @genres = []
  self.songs.collect do |song| 
  @genres << song.genre unless @genres.include?(song.genre)
end 
@genres
end


end