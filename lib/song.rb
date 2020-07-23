class Song 
  attr_accessor :name 
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end 
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
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
    all.detect { |song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create(name)
  end
end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_instance = self.new(song)
    new_instance.artist_name = artist
    new_instance.genre_name = genre
    new_instance
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name.gsub(".mp3", ""))
    genre.songs
  end
    
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
end
