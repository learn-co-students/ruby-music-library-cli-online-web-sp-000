class Genre 
  attr_accessor :name, :song
  @@all = []
  extend Concerns::Findable
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
  def self.destroy_all 
    @@all.clear
  end
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  def songs 
    @songs
  end
  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq 
  end
end