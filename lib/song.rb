require "pry"

class Song


attr_accessor :name
attr_reader :artist, :genre
@@all = []

  def initialize(name, artist = nil, genre = nil)
  @name= name
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
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist) 
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre) 
    @genre = genre
    genre.add_genre(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else 
      self.create(name)
     end
  end
  
  def self.new_from_filename(filename)
   artist, song, genre = filename.split(" - ")
   artist_name = Artist.find_or_create_by_name(artist)
   genre_name = genre.gsub(".mp3", "")
   song_genre =  Genre.find_or_create_by_name(genre_name)
   song = Song.find_or_create_by_name(song)
   song.artist = artist_name
   song.genre = song_genre
   song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end

