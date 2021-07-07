class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if !self.songs.include? song
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

end
