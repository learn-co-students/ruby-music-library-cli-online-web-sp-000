require './lib/concerns/findable.rb'

class Song
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  extend Concerns::Findable  #class module
  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist= artist if artist != nil
    self.genre=  genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
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

  def self.create(name)
    song = Song.new(name)
    song.save
    return song
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(file)
    #Action Bronson - Larry Csonka - indie.mp3
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    genre_name = file.split(" - ")[2].chomp(".mp3")

    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)

    return song
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

  def self.find_by_name(name)
      self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end

end
