require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

def self.create(name, artist = nil, genre = nil)
  new_song = Song.new(name, artist = nil, genre = nil)
  new_song.save
  new_song
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs.include?(self) ? nil : genre.songs << self
end

#binding.pry
def self.find_by_name(search_name)
  @@all.detect do |s|
    s.name == search_name
  end
end

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) == nil ? song_name = Song.create(song_name) : self.find_by_name(song_name)
end

def self.new_from_filename(filename)
  filename_split = filename.split(" - ")
  artist_name, song_name, genre_name = filename_split[0], filename_split[1], filename_split[2].gsub(".mp3", "")
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  self.new(song_name, artist, genre)
end

def self.create_from_filename(filename)
  new_song = self.new_from_filename(filename)
  new_song.save
end
end #end of Song class
