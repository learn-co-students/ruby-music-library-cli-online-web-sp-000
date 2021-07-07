require 'pry'
require_relative '../config/environment.rb'
class Genre
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
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    # initializes, saves, and returns the Song
    genre = self.new(name)
    genre.save
    genre
  end
  def songs
    @songs
  end
  def artists
    # returns a collection of artists for genre has many artists through songs
      self.songs.collect {|songs| songs.artist}.uniq
  end

end
