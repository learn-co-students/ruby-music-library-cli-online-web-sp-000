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
#   end
#
#   def self.all
#     @@all
#   end
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
