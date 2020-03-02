class Song
  
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
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
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.create(name)
    song = new(name)
    song.save 
    song
  end 
  
  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    
    split_name = filename.split(" - ")
    song_name = split_name[1]
    artist_name = split_name[0]
    genre_name = split_name[2].split(".")[0]  #removes the .mp3 via split and returns the first array avlue (eg: genre)
    
    #eg - Action Bronson - Larry Csonka - indie.mp3  // Split via " - " - [1]song = Larry Csonka - [0]artist = Action Bronson.mp3 - [2]genre = indie // split via "." - [0] = Action Bronson
    
    new_song = self.find_or_create_by_name(song_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    
    new_song.artist=(new_artist)
    new_song.genre=(new_genre)
    new_song
  end  
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  
end 

