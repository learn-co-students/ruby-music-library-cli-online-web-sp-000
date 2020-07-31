class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist 
    self.genre = genre 
    save 
  end 
    
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    song = Song.new(name)
  end
  
  def artist=(artist)
    if artist.class == Artist 
      @artist = artist
      artist.add_song(self)
    end
  end 
  
  def genre=(genre)
    if genre.class == Genre 
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self 
      end
    end 
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name 
        return song 
      end 
    end 
    false
  end 
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song != false 
      return song
    else 
      self.create(name)
    end 
  end 
  
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    name = array[1]
    genre_name = array[2].split('.').first
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    if !@@all.include?(song)
      @@all << song
    end
  end 
  
  
end 