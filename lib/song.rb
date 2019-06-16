require 'pry'
require_relative '../config/environment.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
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
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    # initializes, saves, and returns the Song
    song = self.new(name) # => song.new("blank Space")
    song.save # @@all << self
    song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    #binding.pry
    end
  end
#   def self.find_by_name(name)
#     # find a song instance in @@all by the name property of the song
#     # all.find{ |song| song.name == name}
#     all.detect {|song| song.name == name}
#   end
#   def self.find_or_create_by_name(name)
#     #returns an existing song with a provided name if one exists in @@all
#     find_by_name(name) || create(name)
#   end
  def self.new_from_filename(filename)
      array = filename.split(" - ")
      song_name = array[1]
      artist_name = array[0]
      genre_name = array[2].split(".mp3").join
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.new(song_name, artist, genre)
    end
    def self.create_from_filename(filename)
      self.new_from_filename(filename).save
    end
end
