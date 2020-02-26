require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

 @@all = []

  def initialize(title, artist = nil, genre = nil)
    @name = title
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(title)
    newSong = Song.new(title)
    newSong.save
    newSong
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def find_by_name(title)
    self.all.detect {|s| s.name == title}
  end
end
