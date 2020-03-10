class Genre
  attr_accessor :name
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    #create an instance of said song
    genre = Genre.new(name)
    #save said instance
    genre.save
    genre
  end
end
