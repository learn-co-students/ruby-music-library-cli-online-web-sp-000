require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless !artist
    self.genre = genre unless !genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @song = self.new(name)
    @song.name = name
    @song.save
    @song
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end