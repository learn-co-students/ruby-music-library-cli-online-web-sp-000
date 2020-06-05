require 'pry'
#Song belongs to an artist
class Song
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  extend Concerns::Findable

  @@all = []

#songs can be initialized with an optional artist argument.
#songs have one genre.
#initialized with an optional genre argument.
  def initialize(name, artist=nil, genre=nil) #setter methods only invoked if song initialize is called with artist and or/ genre arguments
    @name = name
    self.artist=(artist) if artist != nil #associations are created upon initialization
    self.genre=(genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

#instances should respond to a save method that adds the instance itself into the appropriate @@all class variable.
  def save
    @@all << self
  end

#initializes, saves, and returns the song
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end

#returns the artist of the song
  def artist
    @artist
  end

#when we call our custom Song artist method, it sets the song's @artist property and adds the song to the artists' collection of songs.
  def artist=(artist) #setter methods. assigns an artist to the song.
    @artist = artist
    artist.add_song(self)
  end

#returns the genre of the song
  def genre
    @genre
  end

#assigns genre to song
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #adds song to genres collection of songs
    #does not add song if already exists
  end

#finds a new song instance in @@all by the name property of the song
  def self.find_by_name(name)
#@@all. detect = an enumerable method that returns the first element
#iterates through each song and returns the song name
    @@all.detect do |song|
      song.name == name
    end
  end

#returns an existing song with the provided name.
#invokes find_by_name.
#creates a song if match not found
#invokes .create
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

#Pair methods:
  def self.new_from_filename(filename)
#instantiates a new Song object based on a provided filename.
#invokes Findable methods
    array = filename.split(" - ")
    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

#same thing^ but saves the newly created song to the @@all class variable.
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
