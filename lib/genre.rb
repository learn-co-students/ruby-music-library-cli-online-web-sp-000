class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artists

  @@all = []
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

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name)
    self.new(name).tap do |genre|
      genre.save
    end
  end
  
  def artists
    songs.map(&:artist).uniq 
  end 
  
  
end
