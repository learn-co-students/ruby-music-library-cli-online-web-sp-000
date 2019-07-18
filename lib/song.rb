require "pry"
class Song 
  
  attr_accessor :name , :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
      if artist != nil
    self.artist=(artist)
      end
      if genre != nil
    self.genre=(genre)
      end
  end
  
  def save 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def self.create(name)
    new = self.new(name)
    new.save
    new
  end 
  
  def self.find_by_name(name)
      new_song = @@all.find {|s| s.name == name}
      new_song
  end
  
  def self.find_or_create_by_name(name)
      if new_song = self.find_by_name(name)
      new_song
      else
      new_song = self.create(name)
      end
  end
  
   def self.new_from_filename(file)
     
    array = file.split(" - ")
    s = find_or_create_by_name(array[1])
    a = Artist.find_or_create_by_name(array[0])
    g = Genre.find_or_create_by_name(array[2].chomp('.mp3'))
    s.artist = a
    s.genre = g
    s
  end
  
  def self.create_from_filename(file)
    c = new_from_filename(file)
    c
  end
 
 def artist=(artist)
   @artist = artist
   @artist.add_song(self)
 end 
 
 def genre=(genre)
   @genre = genre
   unless genre.songs.include?(self)
   genre.songs << self
  end
 end
 
  
end