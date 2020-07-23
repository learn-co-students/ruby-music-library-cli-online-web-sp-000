require 'pry'

class Song
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
     @artist = artist
     artist.add_song(self)
  end

  def genre
    @genre
  end

  def save
    self.class.all << self
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    artist_string = file_array[0]
    song_string = file_array[1]
    genre_string = file_array[2]
    genre_array = genre_string.split(".")

    artist = Artist.find_or_create_by_name(artist_string)
    genre = Genre.find_or_create_by_name(genre_array[0])

    new_instance = Song.new(song_string, artist, genre)
    new_instance
  end

  def self.create_from_filename(file_name)
    new_instance = self.new_from_filename(file_name)
    @@all << new_instance
    new_instance
  end

end
