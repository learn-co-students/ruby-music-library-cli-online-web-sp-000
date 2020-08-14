# rspec spec/001_song_basics_spec.rb
require 'pry'
class Song# < MusicImporter

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      self.artist = artist
    end
    if genre != ""
      self.genre = genre
    end
    save
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
    self.new(name)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = filename.split(" - ")[2].gsub(".mp3","")
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    # song = self.new_from_filename(filename)
    # Song.all << self
    # self
    Song.all << self.new_from_filename(filename)
  end

end