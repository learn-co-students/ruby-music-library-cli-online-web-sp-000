require 'pry'

class Song
  attr_accessor :name, :artist

 @@all = []

  def initialize(title, artist = "")
    @name = title
    @artist = artist
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

  def self.create(title)
    newSong = Song.new(title)
    newSong.save
    newSong
  end

  def artist=(artist)
    binding.pry
    artist.add_song(self)
  end
end
