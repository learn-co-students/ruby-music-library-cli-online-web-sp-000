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
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.create(name)
    genre = self.new(name)
    genre.save 
    genre 
  end 
  
  def save 
    @@all << self 
  end 
  
  def songs 
    @songs 
  end 
  
  def artists
    songs.map{|song| song.artist}.uniq 
  end 

end 