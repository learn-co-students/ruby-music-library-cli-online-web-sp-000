require 'pry'
class Genre
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist
  @@all = []
  def initialize (name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def artists
    artists = @songs.map do |song|
      song.artist
    end
    uniq_artists = artists.uniq
    uniq_artists
  end
end
