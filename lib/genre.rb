require "pry"
class Genre
 

attr_accessor :name, :songs

@@all = []

  def initialize(name)
  @name=name
  @@all << self
  @songs = []
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
  genre = Genre.new(name)
  genre.save
  genre
end


def add_genre(song)
    if song.genre == nil
      song.genre = self
    end
    if !@songs.include?(song)
    @songs << song
  end
end

def find_songs
  Song.all.select {|song| song.genre == self}
end

def artists 
  find_songs.map {|song| song.artist }.uniq
end
  

  
end