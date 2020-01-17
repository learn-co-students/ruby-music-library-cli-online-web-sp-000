require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect(&:genre).uniq
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
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

end
