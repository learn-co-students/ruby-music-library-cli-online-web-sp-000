class Genre
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def songs
    @songs
  end
    
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def artists
     artists = songs.map {|song| song.artist}
     artists.uniq
  end
end