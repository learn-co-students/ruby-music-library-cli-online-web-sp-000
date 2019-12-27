class Genre
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods

  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []

    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(genre)
    @@all << Genre.new(genre).save
  end

  def songs
    @songs
  end

  def artists
    array = songs.collect do |song|
      song.artist
    end
    array.uniq
  end


end
