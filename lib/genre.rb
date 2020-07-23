class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def artists
    artists = []
    songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
end
