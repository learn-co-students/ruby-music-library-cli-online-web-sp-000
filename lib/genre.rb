require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name

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

  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def artists
    artist_array = @songs.collect {|song| song.artist}
    artist_array.uniq
  end

end
