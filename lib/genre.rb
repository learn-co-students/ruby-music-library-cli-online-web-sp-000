class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  attr_reader :songs
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    @songs.collect{ |s| s.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap{|g| g.save}
  end
end
