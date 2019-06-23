require_relative './Concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
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
  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end
  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end
  def genres
    self.songs.map {|item| item.genre}.uniq
  end
end
