class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  # stuck in a loop between song.artist= and artist.add_song
  
  def add_song(song)
    if song.artist != nil
      song.artist = self
      self.songs << song
    end
  end
  
  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres
    #binding.pry
  end
  
  def self.destroy_all
    self.all.clear
  end
end