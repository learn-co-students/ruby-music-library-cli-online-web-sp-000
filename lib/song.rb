require "pry"
class Song
  attr_accessor :name, :genre, :artist
  
  @@all = []
  
  
  def initialize(name, artist = nil, genre = nil)
  @name = name 
  @artist = artist
  @genre = genre
  self.artist=(@artist) if artist.class==Artist
  self.genre=(@genre) if genre.class==Genre
  end

  def self.all 
  @@all  
  end 
    
   def artist_name 
    if self.artist != nil
      self.artist.name
    else nil
  end
  end 
   

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
      
    end
  end
    


   def artist=(artist)
  @artist = artist
 @artist.add_song(self)
end
  
  
  

  def artist=(artist)
      @artist = artist
     @artist.add_song(self)
  end

  
  def self.destroy_all
  @@all.clear  
  end 


  def self.create(name)
     song = Song.new(name)
     song.save
     song
  end
  
  def save
     @@all << self
  end 
  
   def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end




  
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    new_song = self.new(name, artist, genre)
  end
      
      
  def self.create_from_filename(filename)
    
    new_from_filename(filename).tap{ |s| s.save}

  end    
   
   
end