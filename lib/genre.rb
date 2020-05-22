class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
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

  def self.create(name)
    ng = Genre.new(name)
    ng.save
    ng
  end

  def songs
    @songs
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

end
