class Artist 
extend Concerns::Findable 
attr_accessor :name, :songs 
  
@@all = [] 


def self.all 
  @@all
end
  
def initialize(name)
  @name = name
  @songs = []
  save
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

def add_song(song)
  if song.artist != self
    song.artist = self 
  end
  @songs << song unless @songs.include?(song)
end
  
  

def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  
  
end