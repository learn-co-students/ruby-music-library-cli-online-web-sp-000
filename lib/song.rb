class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name= name
    self.artist = artist if artist 
    self.genre = genre if genre 
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
  
  def self.create(thing)
    self.new(thing).tap do |song|
    song.save
  end
end

def artist=(artist)
  @artist = artist 
  @artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end 

def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end
  
def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create(name)
  end
end

def self.new_from_filename(file)
 song = Song.new(file.split(" - ")[1])
 song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
 song.genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3",""))
 song  
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save 
end
  
end