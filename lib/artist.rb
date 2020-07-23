
require_relative "../lib/concerns/findable.rb"

class Artist
  extend Concerns::Findable
  # include Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def add_song(song) #song belongs to artist
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.create(name)
    Artist.new(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end


end
