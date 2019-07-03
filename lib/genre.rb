# Genre class and rspec: rspec spec/003_genre_basics_spec.rb
require_relative "../lib/concerns/findable.rb"

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

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
    if song.genre == nil
      song.genre = self
    end
    unless @songs.include? song
      self.songs << song
    end
  end

  def artists
    @artists = []
    self.songs.each do |song|
      unless @artists.include? song.artist
        @artists << song.artist
      end
    end
    @artists
  end

end
