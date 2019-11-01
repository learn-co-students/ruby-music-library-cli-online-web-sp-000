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

  def self.destroy_all
    self.all.clear
  end
end

#
#   def add_song(song)
#     @songs << song
#     song.artist = self
#   end
#
#   def add_songs(songs)
#     songs.each { |song| add_song(song) }
#   end
# end
