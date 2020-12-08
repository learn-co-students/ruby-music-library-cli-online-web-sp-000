require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre, :other_genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    @name = name
    artist.save
    artist
  end


end
