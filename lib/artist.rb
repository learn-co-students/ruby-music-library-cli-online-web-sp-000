require 'pry'

class Artist

#   extend Findable::ClassMethods
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    return artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end

# self.songs.each { |song| song.genre }
#
#
#   def add_songs(songs)
#
#   end
# end
