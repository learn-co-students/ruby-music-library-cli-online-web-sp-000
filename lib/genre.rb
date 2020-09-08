require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    self.name = name
    self.songs = []
    @@all << self
  end

  def save
    @@all << self
  end

  def artists
    artist_list = []
    self.songs.collect do |song|
      artist_list << song.artist
    end
    artist_list.uniq
  end

  def self.create(name)
    @@all << self.new(name)
    @@all.last
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
