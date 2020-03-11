require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  def self.new_from_filename(file)
    name = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    genre = file.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
  # def self.find_by_name(name)
  #   all.find {|i| i.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if find_by_name(name)
  #     find_by_name(name)
  #   else
  #     self.create(name)
  #   end
  # end
end
