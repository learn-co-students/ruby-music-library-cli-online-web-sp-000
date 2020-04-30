class Song
  
  @@all = []
  
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    title = parts[1]
    artist = Artist.find_or_create_by_name(parts[0])
    genre = Genre.find_or_create_by_name(parts[2].chomp(".mp3")) 
    new_song = Song.new(title, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    
  end

  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name, artist = nil, genre = nil)
    song = self.new(name)
    song.save
    song
  end
  
end