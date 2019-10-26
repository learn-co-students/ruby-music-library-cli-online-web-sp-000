class Artist
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
  
  def save
    @@all << self
  end
  
  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    genres = @songs.map { |s| s.genre }
    genres.uniq
  end
end