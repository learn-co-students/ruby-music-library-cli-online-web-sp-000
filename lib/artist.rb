require 'pry'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    genres_array = []
    self.songs.collect do |song|
      genres_array << song.genre unless genres_array.include?(song.genre)
    end
    genres_array
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end