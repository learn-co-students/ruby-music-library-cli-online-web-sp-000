class Song
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name = nil, artist = nil)
    @name = name
    self.artist = artist unless artist == nil
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
    self.new.tap do |song|
      song.name = name
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end
