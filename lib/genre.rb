class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end

end


