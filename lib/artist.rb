require 'pry'

class Artist

extend Concerns::Findable

  attr_accessor :name, :songs, :artist

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
    self.class.all << self
  end

  def self.create(new_artist)
    var = Artist.new(new_artist)
    var.save
    var
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    self.songs.map {|x| x.genre}.uniq
  end


end
