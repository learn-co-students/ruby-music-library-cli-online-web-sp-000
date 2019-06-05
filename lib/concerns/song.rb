class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name,artist = nil, genre = nil)
    @name = name
    @@all = []
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(new_song)
    song = Song.new(new_song)
    song.save
    song
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end  
end
