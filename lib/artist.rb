require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
