require 'pry'


class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
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
    if song.artist == nil
      song.artist = self
    end
    self.songs << song if !(self.songs.include?(song))
  end

  def genres
    songs.collect {|song| song.genre}.uniq
    #binding.pry
  end
end
