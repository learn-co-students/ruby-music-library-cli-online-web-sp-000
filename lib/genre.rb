require './config/environment.rb'

class Genre
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
    song.genre = self unless !!(song.genre)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    (self.songs.collect {|song| song.artist}).uniq
  end

end
