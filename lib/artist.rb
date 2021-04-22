class Artist 
  attr_accessor :name
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    return artist
  end
  
  def songs 
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def add_song(song)
    song.artist = self unless song.artist
  end
  
  def genres 
    genre_arr = self.songs.map do |s|
      s.genre
    end
    
    return genre_arr.uniq
  end

end