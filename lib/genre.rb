class Genre  
extend Concerns::Findable 
attr_accessor :name, :songs 
  
@@all = [] 


def self.all 
  @@all
end
  
def initialize(name)
  @name = name 
  save
  @songs = []
end
  
def self.destroy_all
  @@all = []
end

def save
  @@all << self  
end
  
def self.create(name)
  self.new(name)
end
  
def artists
  artist = @songs.collect do |song|
    song.artist
  end
    artist.uniq  
end
  
  
  
end