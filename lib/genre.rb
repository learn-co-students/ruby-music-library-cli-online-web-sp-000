class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

   def self.create(name)
      genre_name = Genre.new(name)
      genre_name.save
      genre_name
    end
end
