require_relative "../lib/concerns/findable.rb"

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.create(name)
    Genre.new(name)
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
