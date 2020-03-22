#module Concerns::Findable
 require "pry"
class Song
  attr_accessor :genre, :song, :name
  attr_reader :artist

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= (artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def artist=(artist)
    @artist = artist if artist != nil
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
      genre.songs << self unless genre.songs.include?(self)
  end

  def add_song
    @songs
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      self.create(name)
    else
      find_by_name(name)
    end
    end

    def self.create_from_filename(name)
      @@all << Song.new_from_filename(name)
    end

    def self.new_from_filename(name)
      song_genre = name.split(" - ")[2].chomp(".mp3")
      song_artist = name.split(" - ")[0]
      song_name = name.split(" - ")[1]
      song = self.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(song_artist)
      song.genre = Genre.find_or_create_by_name(song_genre)
      song
    end
  end
