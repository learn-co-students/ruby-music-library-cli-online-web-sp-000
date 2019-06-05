class Genre
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @@all = []
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
  
  def self.create(new_genre)
    genre = Genre.new(new_genre)
    genre.save
    genre
  end
end

