class Song 
  attr_accessor :name, :artist, :genre  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    if(artist != nil)
      self.artist=(artist)
    end 
    if(genre != nil )
      self.genre=(genre) 
    end 
    save 
  end 
  def self.all 
    @@all 
  end 
  def save 
    @@all << self 
  end 
  def self.destroy_all 
    self.all.clear 
  end 
  def self.create(name)
    new_song = Song.new(name)
    new_song.save 
    new_song 
  end 
  def artist=(name)
    @artist = Artist.find_or_create_by_name(name)
  end 
  def genre=(genre)
    @genre = Genre.find_or_create_by_name(genre)
  end 
  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    name = splits[1]
    artistName = splits[0]
    newSong = Song.new(name)
    newSong.artist=(artistName)
    newSong 
  end 
  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end 
  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
      self.create(name)
    else 
      self.find_by_name(name)
    end 
  end 
  def self.find_by_name(name)
    self.all.select {|song| song.name = self}
  end 
end 