require_relative "../config/environment.rb"

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(genre_name)
    self.new(genre_name)
  end

  def songs
    @songs
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

end
