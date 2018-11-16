class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    all << artist
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    songs.include?(song) ? song : songs << song
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end
end
