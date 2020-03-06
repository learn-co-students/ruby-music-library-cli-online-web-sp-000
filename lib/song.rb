class Song
  extend Concerns::Findable
   
  attr_accessor :name
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
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
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre.gsub(".mp3", ""))
    new_song = self.new(song, new_artist, new_genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
end