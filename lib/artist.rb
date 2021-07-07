require_relative "../lib/concerns/findable.rb"
class Artist
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
  def self.create(artist)
    a = Artist.new(artist)
    a.save
    a
end

  def songs
    @songs
  end
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end
