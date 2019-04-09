class Song
  attr_accessor :name, :genre, :artist
 # attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
  #  @artist = artist
    self.artist=(artist) if artist != nil
  #  @genre = genre
    self.genre=(genre) if genre != nil
  end
  
  #sets song's artist to argument
  #adds self to list of artists songs
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def save
    @@all << self  
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create(name)
    else
      song
    end
  end
  
  
  #initializes!!! not create DOES NOT SAVE TO @@ALL
  def self.new_from_filename(filename)
    #split filename into array by ' - '
    arr = filename.split(" - ") #=> ['Artist', 'Song', 'Genre.mp3']
    
    #acquire song title from array
    #***not sure if i'm supposed to use self.find_or_create_by_name here...
    #because the method is new from file name not create...
    song_title = arr[1] #song title
    
    #create artist and genre instance from strings
    artist = Artist.find_or_create_by_name(arr[0])
    genre = Genre.find_or_create_by_name(arr[2].chomp(".mp3"))
    
    # intializes new song with song_title, artist, and genre
    song = Song.new(song_title, artist, genre)

  end
  
  #creates from file name DOES SAVE TO @@ALL
  def self.create_from_filename(filename)
#    arr = filename.split(" - ") #=> ['Artist', "Song Title", "Genre.mp3"]
    
    #creates or finds song instance with song title    
 #   song = self.find_or_create_by_name(arr[1])

    #create artist and genre instance from string
 #   artist = Artist.find_or_create_by_name(arr[0])
 #   genre = Genre.find_or_create_by_name(arr[2].chomp(".mp3"))
    
    #assign song's artist and genre
 #   song.artist = artist
 #   song.genre = genre
    
    #return song
 #   song
 
    song = self.new_from_filename(filename)
    self.all << song
    song
  end
end