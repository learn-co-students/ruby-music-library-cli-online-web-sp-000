require './config/environment.rb'

class Artist
  attr_accessor :name, :songs

  @@all =[]

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist = self unless !!(song.artist)
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    (self.songs.collect {|song| song.genre}).uniq
  end

end
