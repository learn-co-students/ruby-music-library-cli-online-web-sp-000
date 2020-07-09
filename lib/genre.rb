require 'pry'

class Genre
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

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == "na"
      song.genre = self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    artists = []
    self.songs.each do |song|
      artist = song.artist
      if artists.include?(artist) == false
        artists << artist
      end
    end
    artists
  end
end
