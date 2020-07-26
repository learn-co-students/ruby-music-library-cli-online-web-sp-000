class Genre

  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :songs, :artist

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.count
    @@all.size
  end

  def self.create(name)
    new_name = self.new(name)
    new_name.save
    new_name
  end

  def artists
      songs.collect { |song| song.artist}.uniq
  end

end
