class Genre
  attr_accessor :name
  attr_reader :artist, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name=name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def self.destroy_all
    all.clear
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end

end
