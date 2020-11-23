class Song
  
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = [ ]
  
  
  def artist=(artist_name)
   @artist = artist_name
   @artist.add_song(self)
  end
  
  def initialize(name, artist_name = "", genre = "")
    @name = name
    @@all << self
    @artist = artist_name
    new = self
    if artist_name != ""
      new.artist = artist_name
    end
    @genre = genre
    if genre != ""
      new.genre = genre
    end
  end
  
  def genre=(genre_name)
    @genre = genre_name
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = [ ]
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_song = Song.new(name)
  end

  def self.find_by_name(song_name)
    to_return = ""
    @@all.each do |song|
      if song.name == song_name
        to_return = song
      else
        to_return = nil
      end
    end
    to_return
  end
  
  
  def self.find_or_create_by_name(song_name)
   if self.find_by_name(song_name) == nil
     self.create(song_name)
   else
     self.find_by_name(song_name)
   end
  end
  
  def self.new_from_filename(path)
    #creates a new instance of a song from the file that's passed
    artist_song_genre = path.split(" - ")
    #creating the artist
    @artist = Artist.find_or_create_by_name(artist_song_genre[0])
    
    #taking the mp3 off of the genre name and finding or creating it
    genre_from_file = artist_song_genre[2].split(".")
    @genre = Genre.find_or_create_by_name(genre_from_file[0])
    
    #separating and creating the song
    song_from_file = artist_song_genre[1]
    new_song = self.new(song_from_file, @artist, @genre)
      
    #adding the song to the artist
    @artist.add_song(new_song)
    
    #associates new song instance with the artist from the filename
    new_song.artist=(@artist)
    
    new_song
  end
  
  def self.create_from_filename(path)
    new = self.new_from_filename(path)
    new.save
  end

end