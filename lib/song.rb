

class Song
 extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name,artist = nil,genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    save
  end
  
  def self.create(name)
    self.new(name) 
  end
  
  def save 
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artist=(art)
    if art.class == Artist
      @artist = art
      art.add_song(self)
    else
      @artist = nil
    end
  end
  
  def genre=(gen)
    @genre = gen
  end
    
  def self.new_from_filename(filename)
    name = filename.split(" - ")
    exist = find_by_name(name[1])
    if exist
      exist.artist = Artist.find_or_create_by_name(name[0])
      exist.genre = Genre.find_or_create_by_name(name[2].split(".")[0])
      exist
    else
      song = Song.new(name[1],Artist.find_or_create_by_name(name[0]), Genre.find_or_create_by_name(name[2].split(".")[0]))
      song
    end
  end
  
  def self.create_from_filename(name)
    new_from_filename(name)
  end
end