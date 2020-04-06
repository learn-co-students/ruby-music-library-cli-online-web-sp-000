require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  # Set the artist instance variable equal to an artist
  def set_artist(artist)
    @artist = artist
  end

  def artist=(artist)
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.create(name)
    Song.new(name).tap {|song| song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  # Return either an existing song or create a new one
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song = Song.find_or_create_by_name(song_info[1])
    song.artist = Artist.find_or_create_by_name(song_info[0])
    song.genre = Genre.find_or_create_by_name(song_info[2].delete_suffix('.mp3'))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
