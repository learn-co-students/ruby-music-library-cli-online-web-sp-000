class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre
    genre
  end

  def artists
    artists = self.songs.collect {|song| song.artist }
    artists.uniq
  end
end
