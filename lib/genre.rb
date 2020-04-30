class Genre

  attr_accessor :name
  extend Concerns::Findable
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
  
  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end