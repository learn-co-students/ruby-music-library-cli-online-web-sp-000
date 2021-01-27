class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{ |s| s.save }
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def genres
    songs.collect {|s| s.genre }.uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song if !songs.include?(song)
  end

end
