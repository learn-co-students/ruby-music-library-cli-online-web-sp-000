require 'pry'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name

  @@all = []  
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def self.all 
    @@all 
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  #genre has many artists through songs / collected and returned unique only
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq 
  end

end