class Genre 
   @@all = []
  attr_accessor :name
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
   # @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save()
    @@all << self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    return genre
  end
  
  def songs 
    Song.all.select do |song|
      song.genre == self
    end
  end
  
  def add_song(song)
    song.genre = self unless song.genre
  end
  
  def artists 
    artist_arr = self.songs.map do |s|
      s.artist
    end
    
    return artist_arr.uniq
  end
  
end