class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :song
  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @song = song
    @songs = []
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

  def songs
    @songs
  end

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def artists
    songs.collect do |song|
       song.artist
     end.uniq
  end
end
