# Artist class and rspec: rspec spec/002_artist_basics_spec.rb
require_relative "../lib/concerns/findable.rb"

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

# basics
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
    new = self.new(name)
    new.save
    new
  end
# end basics

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    unless @songs.include? song
      self.songs << song
    end
  end

  def genres
    @genres = []
    self.songs.each do |song|
      unless @genres.include? song.genre
        @genres << song.genre
      end
    end
    @genres
  end

end
