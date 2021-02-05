class Genre
  
  attr_accessor :name
  
  @@all = []
  
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  # These are unique to Genres
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song
    @songs.uniq!
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def artists
    genre_artists = []
    self.songs.each do |g|
      genre_artists << g.artist
    end
    genre_artists.uniq!
    genre_artists
  end
  
  
end