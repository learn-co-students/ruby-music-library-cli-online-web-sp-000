class Genre

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    songs << song unless songs.include?(song)
  end

  def artists
    songs.collect { |s| s.artist}.uniq
  end
end
