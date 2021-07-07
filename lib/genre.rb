require_relative "../lib/concerns/findable.rb"

class Genre
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable
  @@all =[]
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(genre)
    a = Genre.new(genre)
    a.save
    a
end
def songs
  @songs
end
def add_song(song)
  song.genre = self unless
  song.genre == self
  @songs << song unless
  @songs.include?(song)
end
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
end
