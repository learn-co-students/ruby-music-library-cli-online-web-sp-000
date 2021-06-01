class Genre
  extend Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize
    save
  end
  
  def self.all
    @@all
  end

end