
class Genre 

  extend Concerns::Findable
  
  attr_accessor :name , :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end

  def save 
    @@all << self
  end 
  
  def self.destroy_all 
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end
 
  def add_song(song)
    song.genre = self unless song.genre == self
  end
  
  def artists 
    @songs.collect{|s| s.artist}.uniq
  end
  
end
