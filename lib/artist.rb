require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end

  def genres
    genres = []
    @songs.each { |song| genres << song.genre if !genres.include?(song.genre) }
    genres
  end

  def self.create(artist_name)
    artist = new(artist_name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
end
