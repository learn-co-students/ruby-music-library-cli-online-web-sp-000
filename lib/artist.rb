require "pry"

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  # def artists_songs
  #   Song.all.select { |song| song.artist == self }
  # end

  def genres
    songs.map { |song| song.genre }.uniq
  end
end
