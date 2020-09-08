require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre

  @@all =[]

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def add_song(song)
    song.artist = self if song.artist == nil

    if not songs.include?(song)
      self.songs << song
    end
  end

  def genres
    genre_list = []
    self.songs.collect do |song|
      genre_list << song.genre
    end
    genre_list.uniq
  end

  def save
    @@all << self
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
