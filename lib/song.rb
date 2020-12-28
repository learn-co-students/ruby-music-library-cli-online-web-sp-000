class Song 
  
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    
    super(name)
    self.artist=(artist)
    self.genre=(genre)
    
  end
  
  def self.all
    
    @@all
    
  end
  
  def self.create(name)
      
    new_song = self.new(name)
    new_song.save
    new_song
      
  end
  
  def artist=(artist)
    
    if(artist)
      artist.add_song(self)
    end
      
  end
  
  def add_artist(artist)
    
    @artist = artist
    
  end
  
  def genre=(genre)
    
    if(genre)
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
    end
  end
  
  def self.new_from_filename(file_name)
    
    file_arr = file_name.gsub(".mp3", "").split(" - ")

    #puts file_arr[1], file_arr[0], file_arr[2]
    
    song = self.find_or_create_by_name(file_arr[1])
    song.artist=(Artist.find_or_create_by_name(file_arr[0]))
    song.genre=(Genre.find_or_create_by_name(file_arr[2]))

    song
    
  end
  
  def self.create_from_filename(file_name)
    
    self.new_from_filename(file_name)
    
  end
  
end