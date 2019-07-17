class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []    #@@all init as an empty array

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    return @@all
  end

  def self.destroy_all
    return @@all.clear
  end

  def save
    @@all << self       #adds GENRE instance to our @@all class Var
  end

  def self.create(name)
    genre = new(name)
    genre.save
    return genre
  end

  def songs
    return @songs
  end

  def artists                                  #returns a collection of artists for all of the genre's songs
    songs.collect{ |s| s.artist }.uniq       #genre has many artists through songs. does not return duplicates with (uniq)
  end
end
