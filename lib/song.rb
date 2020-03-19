

class Song 
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
  
  def self.create(song)
    self.new(song).tap do|song|
      song.save
    end
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre
    @genre 
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.collect {|song| song.name == name}
    end 
  end
    
end 
