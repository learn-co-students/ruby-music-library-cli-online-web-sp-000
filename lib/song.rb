require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all =  []

  def initialize(name, artist = nil, genre = nil)
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
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    file_parts = file_name.split(" - ")
    artist_name = file_parts[0]
    song_name = file_parts[1]
    genre = file_parts[2]
    # binding.pry

    Artist.find_or_create_by_name(artist_name)
    Genre.find_or_create_by_name(genre)
    Song.create(song_name)
  end

  def create_from_filename

  end

end
