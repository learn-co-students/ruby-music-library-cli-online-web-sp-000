class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = []
  end

  def self.all
    @@all
  end

  def self.create(genre)
    genre = Genre.new(genre)
    @@all << genre
    genre
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if self.songs.include?(song) == false
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end
end
