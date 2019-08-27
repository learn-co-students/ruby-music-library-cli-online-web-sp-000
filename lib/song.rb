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
    genre.songs.push self unless genre.songs.include? self
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
    self.class.all << self
   end
   
   def self.create(name)
     song = new(name)
     song.save
     song
   end
   
   
    def add_song(song)
      song.artist = self unless song.artist
      song.push song unless songs.include?(song)
    end 
    
    def find_by_name
  end
end