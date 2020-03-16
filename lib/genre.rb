class Genre

  extend Concerns::Findable

@@all = []

attr_accessor :name

def initialize(name)
@songs = []
@name = name
self.save
end

def save
@@all << self
end

def add_song(song)
if songs.none?(song) == true
  @songs << song
  song.genre = self
end
end

def songs
@songs
end

def artists
  @artists
end

def self.create(name)
genre = Genre.new(name)
genre.save
genre
end

def artists
  arr = []
@songs.each do |song|
  if song.genre == self
    arr << song.artist
  end
end
arr.uniq
end

def self.all
@@all.uniq
end


def self.destroy_all
@@all.clear
end

end
