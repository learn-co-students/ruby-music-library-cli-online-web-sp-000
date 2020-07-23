class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    songs << song if songs.include?(song) == false
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
