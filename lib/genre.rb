class Genre

  attr_accessor :name

  @@all = []
  @songs = []

  def initialize(name)
    @name = name
    @songs = songs
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
    self.songs.map { |song| song.artist }
  end
end
#
#   def songs
#     Song.all.select do |song|
#       song.genre == self
#     end
#   end
#
#
# end
