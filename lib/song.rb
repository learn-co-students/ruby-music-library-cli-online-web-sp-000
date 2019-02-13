require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil

    if genre != nil
      self.genre = genre
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_song = Song.new(name)
    created_song.save
    created_song
  end

  def self.destroy_all
    @@all.clear
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
    genre.songs << self if !genre.songs.include?(self)
  end

end
