 class Song < Base
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end 
  
  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.songs << self
  end
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].split(".mp3")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
  
end 