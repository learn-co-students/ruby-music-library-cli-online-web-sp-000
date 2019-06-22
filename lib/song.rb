class Song 
  
  attr_accessor :name, :artist, :genre

  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist =(artist) unless artist == nil
    self.genre = (genre) unless genre == nil
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist 
    @artist
  end
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  
  @@all = []
  
  def initialize(name)
    @name = name
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
  
  def self.create(song, artist=nil, genre=nil)
    new_song = Song.new(song, artist, genre)
    save
  end
    
end