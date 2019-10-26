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
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save
    genre
  end
  
  def artists
    artists = @songs.map { |s| s.artist }
    artists.uniq
  end
end