class Artist
 extend Concerns::Findable
  
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  
  def add_song(song) #if song already belongs to an artist, do not assign to an artist
      @songs << song unless songs.include?(song)
      song.artist = self unless song.artist
    end
  
  

  def genres
    self.songs.map do |song|
      song.genre
    end.uniq
  end
  

end