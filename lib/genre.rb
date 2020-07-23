require_relative './concerns/findable'

class Genre

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

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Genre.new(name).tap {|g| g.save}
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre if song.genre != self
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end


end