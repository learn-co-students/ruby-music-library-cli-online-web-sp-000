class Song
  extend Findable 
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    
    self.artist= artist if artist

    @genre = genre
    self.genre = genre if genre
  end
  
  def self.all
    @@all 
  end
  
  def self.reset_all 
    all.clear
  end
  
  def self.count
    @@all.size
end

def save
  @@all << self
  end
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    all.detect{|song| song.name == name}
    self.find_by_name || create(name)
end
