class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.count
    @@all.size
  end
  
end