

class Genre 
  attr_accessor :artist, :songs, :name
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
  
   def self.create(genre)
    self.new(genre).tap do|genre|
      genre.save
    end
  end
  
  def songs 
    @songs 
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
    
  
  
end