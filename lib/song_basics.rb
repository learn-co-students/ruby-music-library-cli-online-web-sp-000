class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []
  
  def initialize(name, artist=nil, genre = nil)
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
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def save 
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    new_song = self.new(name)
    new_song.artist = artist
    new_song
  end
  
  # def self.find_by_name(name)
  #   self.all.find {|n| n.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #   find_by_name(name) || create(name)
  # end
  
end