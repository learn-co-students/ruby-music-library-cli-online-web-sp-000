class Song 
  
  attr_accessor :name, :artist
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) 
    self.genre=(genre)
    
  end 
  
  @@all = [] 
  
  def self.all 
    @@all
  end 
  
  def save
    Song.all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end 
  
  def artist 
    @artist 
  end
  
  def genre 
    @genre 
  end
  
  def artist=(artist)
    @artist = artist 
    if artist != nil
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil 
      genre.add_song(self)
    end
  end
  
  def self.find_by_name(name)
    Song.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil 
      Song.create(name)
    else 
      song 
    end
  end
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.gsub(".mp3", "")
    new_song = Song.new(song_name)
    #song = Song.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song.artist = artist 
    new_song.genre = genre 
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save 
    new_song
  end
      

end

