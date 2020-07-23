class Genre
  extend Concerns:: Findable
  attr_accessor :name
  attr_reader :songs
  @@all= []

  def initialize(name)
    @name= name
    @songs= []
  end

  def artists
    songs.map{|e| e.artist}.uniq
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
