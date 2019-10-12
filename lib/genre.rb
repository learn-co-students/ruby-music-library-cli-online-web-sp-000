class Genre
  
  extend Concerns::Findable

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
    
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  
  def save
    @@all << self
  end
  
  def artists
    songs.collect {|artist_iterator| artist_iterator.artist }.uniq
  end
  

end