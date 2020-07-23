class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self if !genre.songs.include?(self)
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
    song = new(name) 
    song.save
    song
  end 
  def self.find_by_name(name)
    all.detect{|s| s.name == name}
  end
  def self.find_or_create_by_name(name) 
    find_by_name(name) != nil ? find_by_name(name) : self.create(name)
  end 
  def self.new_from_filename(filename)
    attributes = filename.split(" - ")
    artist, name, genre = attributes[0], attributes[1], attributes[2].gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(name, artist, genre) 
  end 
  def self.create_from_filename(filename)
    new_from_filename(filename).tap {|s| s.save}
  end
end 