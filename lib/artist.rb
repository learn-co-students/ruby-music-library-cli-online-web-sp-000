require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end

    if !self.songs.include?(song)
      self.songs << song
    end

  end

  def genres
    genre_array = []
    self.songs.each do |song|
      if !genre_array.include?(song.genre)
        genre_array << song.genre
      end
    end
    genre_array
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
    self.all.clear
  end

end
