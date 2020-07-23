require 'pry'

class Genre
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

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

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre != nil
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.collect{|song|song.artist}.uniq
  end

  def save
    self.class.all << self
  end

end
