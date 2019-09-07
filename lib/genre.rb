class Genre
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable

  def initialize (name)
    @name = name
    @songs = []
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      artists_array << song.artist if !artists_array.include?(song.artist)
    end
    artists_array
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

  def self.create (name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
end
