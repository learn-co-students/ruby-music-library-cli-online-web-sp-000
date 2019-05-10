require 'pry'
class Artist
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name, :genre, :songs
  @@all = []
  def initialize (name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def add_song(title)
    if !(@songs.include?(title))
      @songs << title
    end
    if title.artist == nil
      title.artist = self
    end
  end
end
