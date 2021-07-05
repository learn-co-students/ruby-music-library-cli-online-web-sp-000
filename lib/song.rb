require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create(name)
    end
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.new_from_filename(file)
    holder = file.delete_suffix(".mp3").split(" - ")
    song = Song.create(holder[1])
    song.artist = Artist.find_or_create_by_name(holder[0])
    song.genre = Genre.find_or_create_by_name(holder[2])
    song
  end

end
