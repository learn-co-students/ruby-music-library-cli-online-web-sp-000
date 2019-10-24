class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
    @@all = []
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
  
  def self.create(name)
    self.new(name)
    @@all << self
    self
  end
  
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
end