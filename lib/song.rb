require "pry"

class Song 
  attr_accessor :name
  attr_reader 
  
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
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def artist
    @artist
  end
    
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def genre
    @genre
  end
  
  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if  !self.find_by_name(song_name)
      self.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.new_from_filename(filename)
    song = self.find_or_create_by_name(filename.split(" - ")[1].strip)
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0].strip)
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chop!.chop!.chop!.chop!)
    
    # binding.pry
    
    song.artist = artist
    song.genre = genre
    
    song
  end
  
  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      @@all << song
  end
  
  
  
end