class Song
  attr_accessor :name
  attr_reader :artist, :genre         #song belongs to artist. returns the genre of the song (song belongs to genre)

  @@all = []

  #init can be invoked with an optional second argument - Artist object to be assigned to the song's 'artist' property (song belongs to artist)
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist    #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    self.genre = genre if genre
  end
  #writer/setter
  def artist=(artist)     #invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)       #assigns a genre to the song (song belongs to genre)
  end
  def self.all
    return @@all
  end

  def self.destroy_all
    return @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)          #creates song
    song.save                 #saves song
    return song               #returns song
  end

  def self.find_by_name(name)         #finds a song instance in @@all by the name property of the song
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
