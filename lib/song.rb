class Song
  attr_accessor :name, :artist, :genre
  
  extend Modules::ClassMethods
  include Modules::InstanceMethods
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    super()
    @name = name
    self.artist = artist if !!artist
    self.genre = genre if !!genre
  end
  
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end