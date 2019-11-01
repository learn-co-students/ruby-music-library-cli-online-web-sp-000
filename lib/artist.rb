require 'pry'

class Artist

#   extend Findable::ClassMethods
#
  attr_accessor :name
  attr_reader :songs
#
  @@all = []


  def initialize(name)
      @name = name
      @songs = []
#
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
    # songs.each { |song| add_song(song) }
    @songs << song
    song.artist = self
  end

  def genres
    self.songs.map { |song| song.genre }
  end

  def self.destroy_all
    self.all.clear
  end
end

#
#
#   def add_songs(songs)
#
#   end
# end
