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
    @@all << song
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

end
