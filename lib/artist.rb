class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :song, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.create(name)
    self.new(name) 
  end
  
  def self.all
    @@all
  end
  
  # --- Methods for saving
  def save 
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  # --- Instance Methods for finding Elements from other classes related to Artist classes
  def songs
    Song.all.select { |song| song.artist == self }
  end
  
  def genres 
    collection = songs.collect { |song| song.genre }
    collection.uniq
  end
  
  # ---Instance Methods for adding relations to other classes
  def add_song(song)
    if song.artist == self
      song.artist
    else
      song.artist = self
    end
  end
  
end