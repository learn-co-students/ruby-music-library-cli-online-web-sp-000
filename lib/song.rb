require "pry"
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
 
  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil #self.artist invokes artist=
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
  
  def self.create(new_song)
    song = Song.new(new_song)
    song.save
    song
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end  
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end  
  end
  
  
  def self.new_from_filename(filename)
    artist_name, song_name, extra = filename.split(" - ")
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)  
    
    gen   = extra.split(".")[0]
    genre = Genre.find_or_create_by_name(gen)
    song.genre = genre
  
    song
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end
