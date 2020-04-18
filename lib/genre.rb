
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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre_obj = self.new(name)
    genre_obj.save
    genre_obj
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end
