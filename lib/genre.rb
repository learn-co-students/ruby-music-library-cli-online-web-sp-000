require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    artists = []
    @songs.each { |song| artists << song.artist if !artists.include?(song.artist) }
    artists
  end

  def self.create(genre_name)
    genre = new(genre_name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
end
