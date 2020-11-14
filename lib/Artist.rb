require_relative "../config/environment.rb"

class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(artist_name)
    self.new(artist_name)
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist || song.artist = self
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
