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

def save
  @@all << self
end

def self.create(name)
  new_genre = self.new(name)
  @@all << new_genre
  @@all.last

end

def self.destroy_all
  @@all.clear
end

def songs
@songs
end

def artists
self.songs.map {|song| song.artist}.uniq
end

end
