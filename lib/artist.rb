require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    if song.artist == self
      nil
    else
      song.artist = self
    end
  end

  def genres
    @songs.collect{|artist| artist.genre}.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end



end
