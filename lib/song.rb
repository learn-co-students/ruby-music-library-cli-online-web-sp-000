class Song

  # extend Findable::ClassMethods

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
  

  def artist=(artist)
    @artist = artist
  end

  def self.destroy_all
    self.all.clear
  end
end
