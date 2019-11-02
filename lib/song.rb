require "pry"
class Song

  # extend Findable::ClassMethods

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist= artist
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(song)
    song = self.new(song)
    song.save
    return song
  end

  def artist=(artist)
    if @artist = artist
      artist.add_song(self)
    end

  end

  def self.destroy_all
    self.all.clear
  end
end
