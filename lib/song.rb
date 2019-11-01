class Song

  # extend Findable::ClassMethods

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize
    @name = name
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
  end

  def self.destroy_all
    self.all.clear
  end
end
