class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
  def self.destroy_all
    self.all.clear
  end
end