require 'pry'

class Artist
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save << self
  end

  def self.all
    @@all
  end

  # def save
  #   self.class.all
  # end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    if song.artist.nil? 
      song.artist = self unless song.artist == self
    end
    @songs << song unless song.artist.songs.include?(song)
  end

  def genres 
    artist_genres = @songs.collect { |song| song.genre }
    artist_genres.uniq
  end
end