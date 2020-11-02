class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    artist_array = Song.all.collect {|songs| songs.artist}
    artist_array.uniq
  end
end
