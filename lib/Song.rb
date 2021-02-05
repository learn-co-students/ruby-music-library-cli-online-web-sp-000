class Song
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end

  # Unique to songs
  
  def self.create(name)
      self.new(name)
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil
      genre.add_song(self)
    end
  end

# Finding things

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == nil
     found = self.create(name)
    end
    found
  end
  
# Importing files

  def self.new_from_filename(filename)
    filename = filename.split(" -")
    song_name = filename[1].strip
    artist_name = filename[0].strip
    genre_name = filename[2].strip.chomp(".mp3")
    song = Song.new(song_name)
    song.artist=(Artist.find_or_create_by_name(artist_name))
    song.genre=(Genre.find_or_create_by_name(genre_name))
    song
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
    
  end
end