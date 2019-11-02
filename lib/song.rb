require "pry"
require_relative '../lib/concerns/findable'
# require './genre.rb'
class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(song)
    song = self.new(song)
    song.save
    return song
  end

  def artist=(artist)
    if @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
      song = Song.find_or_create_by_name(filename.split(" - ")[1])
      song.artist= Artist.find_or_create_by_name(filename.split(" - ")[0])
      # binding.pry
      song.genre= Genre.find_or_create_by_name(filename.split(".")[2])

      song
  end

  def self.create_from_filename(filename)
      @@all << self.new_from_filename
    end

  def self.destroy_all
    self.all.clear
  end
end
