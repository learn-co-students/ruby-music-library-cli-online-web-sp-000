require_relative "../config/environment.rb"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist_name = nil,genre_name = nil)
    @name = name
    self.artist = artist_name if artist_name
    self.genre = genre_name if genre_name
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(song_name)
    self.new(song_name)
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
    song_name = File.basename("#{filename}", ".*").split(" - ")[1]
    artist_name = File.basename("#{filename}", ".*").split(" - ")[0]
    genre_name = File.basename("#{filename}", ".*").split(" - ")[2]

    artist_obj = Artist.find_or_create_by_name(artist_name)
    genre_obj = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist_obj, genre_obj)

  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
