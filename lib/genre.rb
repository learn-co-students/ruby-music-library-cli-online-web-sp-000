class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  def songs
    @songs
  end
  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song if !@songs.include?(song)
  end
  def artists
    self.songs.collect {|s| s.artist}.uniq
  end
end
