require 'pry'

class Artist
  extend Concerns::Findable #extends concerns findable module

  attr_accessor :name #writes and reads a name
  attr_reader :songs #only needs to get the songs

  @@all = []

  def initialize(name)
    @name = name #name gets set upon initialization
    @songs = [] #all songs added to the
  end

  def save
    @@all << self
  end

  def self.create(artist)
    self.new(artist).tap {|name| name.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    songs.collect { |song| song.genre}.uniq
  end
end
