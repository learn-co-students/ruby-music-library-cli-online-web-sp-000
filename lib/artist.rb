class Artist 
  attr_accessor :name
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    #artist.add_song(song)
    if !song.artist
      song.artist = self
    end
    if !self.songs.include?(song)
      @songs << song
    end
  end
 
  def songs
    @songs
  end
  
  def genres 
    #artist.genres returns genres of the songs by that artist
    #artist has many genres through songs.
    genres = []
    @songs.each do |song|
      genres << song.genre if !genres.include?(song.genre)
    end
    genres
  end
  
  
end