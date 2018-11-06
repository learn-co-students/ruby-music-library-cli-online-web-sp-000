class Genre
  attr_accessor :name

  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new.tap do |genre|
      genre.name = name
      genre.save
    end
  end
end
