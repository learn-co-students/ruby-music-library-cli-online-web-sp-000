class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist unless artist == nil 
    self.genre= genre unless genre == nil 
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
  end 
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end 
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split(".mp3")[0].split(" - ")
    artist = Artist.find_or_create_by_name(file_array[0])
    genre = Genre.find_or_create_by_name(file_array[2])
    self.new(file_array[1], artist, genre)
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end 

end 