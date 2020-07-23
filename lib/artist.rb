require "pry"

class Artist
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end


  def add_song(name)
    name.artist = self unless name.artist
    @songs << name unless @songs.include?(name)
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
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end
