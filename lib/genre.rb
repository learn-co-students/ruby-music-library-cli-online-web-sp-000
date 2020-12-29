require 'pry'
include Concerns::Findable

class Genre
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song

      if song.genre != self
        song.genre = self
      end
    end
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end
end
