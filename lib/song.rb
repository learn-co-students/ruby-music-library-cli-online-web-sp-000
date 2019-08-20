require "pry" 
class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre  
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self 
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save 
    @@all << self unless @@all.include?(self)
  end
  
  def self.create(name)
    self.new(name).tap do|song|
      song.save
    end
  end

  def self.find_by_name(name)
    @@all.find do |song|
        song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(file)
    artist, song, genre = file.split(" - ") #destructuring 
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    binding.pry     
  end
  
end