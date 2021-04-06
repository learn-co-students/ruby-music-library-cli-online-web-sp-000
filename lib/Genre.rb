class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
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

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    Song.all.select do |song|
      song.genre == self 
    end
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end


end