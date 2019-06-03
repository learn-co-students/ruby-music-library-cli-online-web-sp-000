class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all
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
    self.new(name).tap do |genre|
      genre.save
    end
  end
end
