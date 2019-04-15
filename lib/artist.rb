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

  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end
  
  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  
  def self.destroy_all
    self.all.clear
  end
end