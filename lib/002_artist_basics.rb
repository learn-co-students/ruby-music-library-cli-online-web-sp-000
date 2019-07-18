class Artist
attr_reader :name, :songs, :genres
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  # song = Song.new(name, self)
  song.artist = self if !song.artist
  @songs << song if !@songs.include?(song)
end
def name=(name)
  @name = name
end
def self.all
  @@all
end
def self.destroy_all
  @@all.clear
end
def save
  @@all << self
end
def self.create(name)
  artist = self.new(name)
  artist.save
  artist
end



end
