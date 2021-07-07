require 'pry'
class Artist
  extend Concerns::Findable
   attr_accessor :name, :songs
   @@all = []

  @@all = []

  def intialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_arist = Artist.new(name)
    new_artist.save
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

end