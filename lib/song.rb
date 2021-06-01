class Song
  extend Findable 
  
  attr_accessor :name
  @@all = []
  
  def initialize
    save
  end
  
  def self.all
    @@all
  end
  
end