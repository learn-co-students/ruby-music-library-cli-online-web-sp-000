require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

 @@all = []

  def initialize(title, artist = nil)
    @name = title
    # @artist = artist
    # binding.pry
    self.artist=(artist) if artist
    # self.artist=(artist)
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
    @artist = artist
    artist.add_song(self)
    # binding.pry
  end


end
