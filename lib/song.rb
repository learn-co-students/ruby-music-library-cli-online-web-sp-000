class Song

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # initializes, saves, and returns the song
  def self.create(song)
    song = self.new(song)
    @@all << song
    song
  end

end
