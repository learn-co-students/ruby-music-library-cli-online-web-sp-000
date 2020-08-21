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
    self.all.clear
  end
  
  def save
    @@all << self 
  end
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def songs 
    @songs 
  end
  
  def artists
    artists = songs.map do |song|
      song.artist 
    end
    artists.uniq
  end
  
end