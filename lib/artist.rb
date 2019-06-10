require 'pry'
require_relative './concerns/findable.rb'

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
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @artist = self.new(name)
    @artist.name = name
    @artist.save
    @artist
  end
  
  def self.songs
    @@all
  end
  
  def genres
    songs.collect { |s| s.genre}.uniq
  end  
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
end