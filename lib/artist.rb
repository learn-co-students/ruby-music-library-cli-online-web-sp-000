require 'pry'

class Artist
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

  def save
    @@all << self
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{|song|song.genre}.uniq
  end

end
