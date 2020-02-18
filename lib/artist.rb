require_relative './concerns/Findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless songs.include?(song)
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end
end
