require "pry"
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, *artist)
    @name = name
    @artist = artist
    self
    binding.pry
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

  def self.create(created_song)
  #  binding.pry
  @@all << Song.new(created_song).save
  end


end
