require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    if not artist == ""
      self.artist = artist
    end
    if not genre = ""
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end
