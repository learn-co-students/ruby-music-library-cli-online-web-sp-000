class Song 

  extend Concerns::Findable 
  
  attr_accessor :name
  attr_reader :artist, :genre   
  
  @@all = [] 
  
  def initialize(name, artist= nil, genre= nil)
    @name = name 
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
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end 
  
  def artist=(artist)
   @artist = artist
   artist.add_song(self)
  end
          
  def genre=(genre)
    @genre = genre 
      if !genre.songs.include?(self) 
        genre.songs << self 
      end 
  end         
  
  def self.new_from_filename(file_name)
   if file_name 
    new_file = file_name.split(" - ")
    artist_name = new_file[0]
    artist = Artist.find_or_create_by_name(artist_name)
    song_name = new_file[1]
    song = Song.new(song_name)
    song_genre = new_file[2]
    song_genre = song_genre.gsub(".mp3", "")
    genre = Genre.find_or_create_by_name(song_genre)
    song.genre = genre 
    song.artist = artist
     song 
   end   
 end 
    
  def self.create_from_filename(file_name)
    file_name = self.new_from_filename(file_name).save
  end 
  
end 