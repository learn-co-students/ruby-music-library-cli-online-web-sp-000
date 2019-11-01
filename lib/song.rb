require "pry"
class Song

  # extend Findable::ClassMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name)
    @name = name

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
  @artist = artist
  Artist.
  end

  def self.destroy_all
    self.all.clear
  end
end
