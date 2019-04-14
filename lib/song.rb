class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil && !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end