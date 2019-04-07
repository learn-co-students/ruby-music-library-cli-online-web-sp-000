require 'pry'
require_relative '../lib/concerns/Findable'


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
  @@all = []
end

def save
  @@all << self
end

def self.create(name)
  self.new(name).tap {|artist| artist.save}
  # artist = Artist.new(name)
  # artist.save
  # artist
end

def add_song(song)
    if song.artist == nil
      song.artist = self
    end
  if !(song.artist.songs.include?(song))
    song.artist.songs << song
    end
end

  def genres
  genres = songs.map do |song|
      song.genre
  end
  genres.uniq
end


end
