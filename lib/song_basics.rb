require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
    
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def save 
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.new_from_filename(filename)
    new_genre = filename.split(/\.|\s-\s/)[2]
    name = filename.split(" - ")[1]
    new_artist = filename.split(" - ")[0]
    genre = Genre.find_or_create_by_name(new_genre)
    artist = Artist.find_or_create_by_name(new_artist)
    new_song = self.new(name, artist, genre)
    new_song
  end
  
  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end
end