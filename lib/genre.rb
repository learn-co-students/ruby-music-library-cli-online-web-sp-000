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
  
  def songs 
    @songs 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name) 
    genre = Genre.new(name) 
    @@all << genre 
    genre
  end
  
  def artists 
    songs.map(&:artist).uniq
  end
  
end 