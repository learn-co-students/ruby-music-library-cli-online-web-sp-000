require 'pry'
class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    # @@all << self
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

  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    songname = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    genrename = filename.split(" - ")[2].chomp(".mp3")
    artistcreate = Artist.find_or_create_by_name(artistname)
    genrecreate = Genre.find_or_create_by_name(genrename)
    self.new(songname, artistcreate, genrecreate)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

end
