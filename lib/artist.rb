require 'pry'
require_relative '../lib/concerns/findable'

class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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

  def self.all
    @@all
  end

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    return artist
  end

  def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end
