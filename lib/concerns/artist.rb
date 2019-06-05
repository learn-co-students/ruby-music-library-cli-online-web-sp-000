class Artist
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(new_artist)
    artist = Artist.new(new_artist)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist != self
    song.artist = self
    @songs << song
    end
  end
  
  def genres
    genres_array = []
    
  end  
end

