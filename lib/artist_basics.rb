class Artist
  
  attr_accessor :name, :song, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def add_song(song)
    song.artist = self
  end
   
   def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist
      song
    else
    song.artist = self #assigns artist to songs
  end
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
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
end