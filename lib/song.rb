require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

#class Method
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
     new_song = Song.new(song)
     new_song.save
     new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(name)
   @@all << self.new_from_filename(name)
 end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    new_song = self.find_or_create_by_name(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end

end #end of the song class
