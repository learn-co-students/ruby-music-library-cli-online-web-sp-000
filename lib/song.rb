require 'pry'
require_relative './concerns/Findable.rb'
require_relative './artist.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if(artist != nil)
      self.artist=(artist)
    end
    if(genre != nil )
      self.genre=(genre)
    end
  end
  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def self.destroy_all
    self.all.clear
  end
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    song_name = splits[1]
    artist_name = splits[0]
    genre_name = splits[2].split(".")[0]
    new_song = self.find_or_create_by_name(song_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    new_song.artist=(new_artist)
    new_song.genre=(new_genre)
    new_song
    #binding.pry
  end
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
end
