require 'pry'
class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end

end
