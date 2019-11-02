# require './song.rb'
# require './artist.rb'
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

  def self.all
    @@all
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    return genre
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

  def songs
    @songs
  end
end
#
#   def songs
#     end
#   end
#
#
# end
