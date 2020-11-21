require 'pry'


class Song 
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist.add_song(self) if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    f = filename.split(/ - |\./)
    a = Artist.find_or_create_by_name(f[0])
    g = Genre.find_or_create_by_name(f[2])
    self.new(f[1], a, g)
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
    
end