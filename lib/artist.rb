require 'pry'

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == "na"
      song.artist = self
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      genre = song.genre
      if genres.include?(genre) == false
        genres << genre
      end
    end
    genres
  end
end
