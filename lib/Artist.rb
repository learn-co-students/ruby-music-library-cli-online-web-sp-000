require 'pry'

class Artist
  extend Concerns:: Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
      if song.artist == nil
        song.artist = self
      end
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end
end
