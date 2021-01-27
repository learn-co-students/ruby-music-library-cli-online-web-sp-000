class Genre
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

  def songs
    @songs
  end

  def add_song(song)
      song.genre = self unless song.genre
      @songs << song if !@songs.include?(song)
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end

end
