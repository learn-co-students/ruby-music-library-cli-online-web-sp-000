class Genre
  attr_accessor :name

 @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    newGenre = Genre.new(name)
    newGenre.save
    newGenre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    songs << song if !songs.detect {|s| s.name == song.name}
  end
end
