require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name

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

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !self.songs.include?(song)
  end

  def genres
    genre_array = @songs.collect {|song| song.genre}
    genre_array.uniq
  end

end
