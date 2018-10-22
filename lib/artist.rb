require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all =  []

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
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    # binding.pry
    song.artist = self unless song.artist
    songs << song if !songs.include? song
  end

  def genres
    songs.each do |song|
      song.genre
    end
  end
end
