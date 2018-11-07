class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name = nil)
    @name = name
    @songs = []
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

  def songs
    @songs
  end

  def artists
    artists = @songs.map{|song| song.artist}
    artists.uniq
  end
end
