require 'pry'
require_relative '../config/environment.rb'
class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def name
    @name
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  def songs
    @songs
  end
  def genres
    # returns collection of genres for all the artist's songs
    # self.songs.map do |song|
    #   song.genre
    # end
    songs.collect { |song| song.genre}.uniq
  end
end
