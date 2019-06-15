class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
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
    if artist
      @artist = artist
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    if genre
      @genre = genre
      if !(genre.songs.include?(self))
        genre.songs << self
      end
    end
  end
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if !song
      song = Song.create(name)
    end
    song
  end
  
  def self.new_from_filename(file_name)
    file_parts = file_name.split(" - ")
    song = self.find_or_create_by_name(file_parts[1])
    song.artist = Artist.find_or_create_by_name(file_parts[0])
    song.genre = Genre.find_or_create_by_name(file_parts[2].split(".").first)
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song
  end
  
end