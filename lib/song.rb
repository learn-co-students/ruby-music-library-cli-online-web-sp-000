require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

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

  def self.find_by_name(name)

    self.all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
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
    created_song = Song.new(name)
    created_song.save
    created_song
  end

  def self.new_from_filename(filename)

    artist, song, genre = filename.split(" - ")
    fixed_genre = genre.chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(filename)

    new_from_filename(filename).save
  end

end
