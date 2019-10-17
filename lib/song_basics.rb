class Song
  
  attr_accessor :name

  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
    
    def self.all
    @@all
  end
  
  def save 
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
end