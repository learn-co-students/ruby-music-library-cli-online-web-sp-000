class Artist
  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    songs << song unless songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create (name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

end
