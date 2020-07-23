require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  # can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)
  # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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

  # initializes, saves, and returns the song
  def self.create(song)
    song = self.new(song)
    if @@all.include?(song) == false
      @@all << song
    end
    song
  end

  def artist
    @artist
  end

  # invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # assigns a genre to the song (song belongs to genre)
  # adds the song to the genre's collection of songs (genre has many songs)
  # does not add the song to the genre's collection of songs if it already exists therein
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  # finds a song instance in @@all by the name property of the song
  # iterate through @@all array to find song.name
  def self.find_by_name(title)
    # song variable is a song instance
    @@all.find {|song| song.name == title}
  end

  # returns an existing song with the provided name if one exists in @@all
  # invokes .find_by_name instead of re-coding the same functionality
  # creates a song if an existing match is not found
  # invokes .create instead of re-coding the same functionality
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  # initializes a song based on the passed-in filename
  # invokes the appropriate Findable methods so as to avoid duplicating objects
  # which instantiates a new Song object based on a provided filename
  # Thundercat - For Love I Come - dance.mp3
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    musician = file[0]
    title = file[1]
    song_genre = file[2].split(".")[0]
    # gives me an artist instance with "Thundercat" as the name property
    artist = Artist.find_or_create_by_name(musician)
    # gives me a genre instance with "dance" as the name property
    genre = Genre.find_or_create_by_name(song_genre)
    # gives me a song instance with "For Love I Come" as the name property
    song = Song.find_or_create_by_name(title)

    song.genre = genre
    song.artist = artist
    song
  end

  # initializes and saves a song based on the passed-in filename
  # invokes .new_from_filename instead of re-coding the same functionality
  def self.create_from_filename(filename)
    saving = new_from_filename(filename)
    saving.save
    saving
  end

end
