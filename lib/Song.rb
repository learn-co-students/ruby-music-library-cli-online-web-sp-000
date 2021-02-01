require 'pry'

class Song
  extend Persistable::ClassMethods
  extend Concerns::Findable
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :artist, :musicimporter, :musiclibrarycontroller
  attr_reader :genre
  @@all = []

  def initialize(name, artist=nil,genre=nil)
    @name=name
    self.artist=(artist) if artist.class==Artist
    self.genre=(genre) if genre.class==Genre
end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end


  def self.create(song)
    song = self.new(song)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


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
