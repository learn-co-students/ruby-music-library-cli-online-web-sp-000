require 'pry'

class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    a = Song.new(name)
    a.save 
    a
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
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create(name)
    else self.find_by_name(name)
    end
  end

  def self.new_from_filename(file)
    #new_array = [ ]
    #new_array = file.split(/[-.]/).map!{|x| x.strip}
    new_array = file.split(' - ')
    new_array_2 = new_array[2].split('.')
    artist = new_array[0]
    song_title = new_array[1]
    #genre = new_array[2]
    genre = new_array_2[0]
    x = Song.find_or_create_by_name(song_title)
    x.artist = Artist.find_or_create_by_name(artist)
    x.genre = Genre.find_or_create_by_name(genre)
    x
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end 
  
end