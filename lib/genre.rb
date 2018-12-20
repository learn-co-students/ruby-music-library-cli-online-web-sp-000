class Genre
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
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    a = Genre.new(name)
    a.save 
    a
  end
  
  def songs 
    @songs 
  end 
  
  def artists
    self.songs.collect{|x| x.artist}.uniq
  end
    
  
end