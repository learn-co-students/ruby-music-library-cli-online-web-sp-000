class Artist

extend Concerns::Findable

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def songs
  @songs
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

def add_song(song)
  song.artist = self unless song.artist == self
  @songs << song unless @songs.include?(song)
end

def genres
  unique_genres = []
  songs.collect {|song| unique_genres << song.genre}
  unique_genres.uniq
end

end
