class Genre

extend Concerns::Findable


attr_accessor :name

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

def songs
  @songs
end

def save
  @@all << self
end

def self.create(name)
  genre = self.new(name)
  genre.save
  genre
end

def artists
  unique_artists = []
  songs.collect {|song| unique_artists << song.artist}
  unique_artists.uniq
end

end
