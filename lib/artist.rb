require 'pry'

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def add_song(song)
    unless song.artist.nil? || @songs.include?(song)
      song.artist = self unless song.artist == self
      @songs << song
    end
  end

  def genres 
    artist_genres = @songs.collect { |song| song.genre }
    artist_genres.uniq
  end
end