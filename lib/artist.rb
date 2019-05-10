require 'pry'
class Artist
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres
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
  def genres
    genres = @songs.map do |song|
      song.genre
    end
    uniq_genres = genres.uniq
    uniq_genres
  end
end
