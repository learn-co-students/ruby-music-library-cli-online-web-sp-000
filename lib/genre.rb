
class Genre 
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :songs 
  
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
    self.new(thing).tap do |genre|
    genre.save
  end
end

def songs
  @songs
end 

def artists
  @artists = []
  self.songs.collect do |song|
    @artists << song.artist unless @artists.include?(song.artist)
end
@artists
end

  
end