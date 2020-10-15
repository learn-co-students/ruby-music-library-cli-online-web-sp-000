class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  def initialize(name, artist = nil, genre = nil) 
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil 
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
  def self.create(song)
    song = Song.new(song)
    song.save 
    song 
  end
  def artist
    @artist
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end
  def self.find_by_name(song)
    self.all.detect {|s| s.name == song}
  end
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
    
    
end
