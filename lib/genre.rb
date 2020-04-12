class Genre
  
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

end