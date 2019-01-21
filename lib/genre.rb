class Genre 
  extend Concerns::Findable
  attr_accessor :name

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
    genre = self.new(name)
    genre.save 
    genre 
  end
  
  def songs 
    songs = Song.all 
    
    songs.select do |s|
      s.genre == self
    end
  end
  
  def artists 
    collection = []
  songs.map do |song|
    collection << song.artist
  end
  collection.uniq 
    
  end
    
  
  

end