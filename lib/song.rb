require_relative "../lib/concerns/findable.rb"

#create Song class, instatiate with a name
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    Song.new(name)
  end

  def self.new_from_filename(filename)
    new_artist, new_song, new_genre = filename.split(" - ")
    genre = new_genre.chomp(".mp3")
    artist = Artist.find_or_create_by_name(new_artist)
    genre = Genre.find_or_create_by_name(genre)
    new(new_song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # def self.find_by_name(name)
  #   self.all.detect{|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
