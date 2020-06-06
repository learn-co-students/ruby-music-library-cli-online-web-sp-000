class Genre
  attr_accessor :name
  @@all=[]
  extend Concerns::Findable

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def save
    @@all<<self
  end

  def self.destroy_all
    @@all=[]
  end

  def self.create(name)
    genre=new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    songs.map {|song| song.artist}.uniq.compact
  end

end
